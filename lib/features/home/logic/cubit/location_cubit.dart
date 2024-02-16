import 'package:flash_eats/features/home/logic/cubit/location_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(const LocationState.initial());

  Future<void> getLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(const LocationState.error(error: "Location permission denied"));
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        emit(const LocationState.error(
            error: 'Location permission permanently denied'));
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      Placemark placemark = placemarks[0];

      emit(
          LocationState.success('${placemark.locality}, ${placemark.country}'));
    } catch (e) {
      emit(LocationState.error(error: 'Error getting location: $e'));
    }
  }
}
