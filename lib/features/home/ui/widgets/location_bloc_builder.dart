import 'package:flash_eats/core/theming/styles.dart';
import 'package:flash_eats/features/home/logic/cubit/location_cubit.dart';
import 'package:flash_eats/features/home/logic/cubit/location_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget locationBlocBuilder() {
  return BlocBuilder<LocationCubit, LocationState>(
    buildWhen: (previous, current) => current is Success || current is Error,
    builder: (context, state) {
      return state.maybeWhen(
        success: (location) {
          return Text(
            location,
            style: TextStyles.font16BlackSemiBold,
          );
        },
        orElse: () => Container(),
      );
    },
  );
}
