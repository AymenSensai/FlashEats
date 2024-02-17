import 'package:flash_eats/features/details/data/models/details_response.dart';
import 'package:flash_eats/features/details/logic/cubit/details_cubit.dart';
import 'package:flash_eats/features/details/logic/cubit/details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class FavoriteBlocListener extends StatefulWidget {
  const FavoriteBlocListener({super.key, required this.id});

  final int id;

  @override
  State<FavoriteBlocListener> createState() => _FavoriteBlocListenerState();
}

class _FavoriteBlocListenerState extends State<FavoriteBlocListener> {
  late bool isFavorite;

  @override
  void initState() {
    isFavorite = false;
    context.read<DetailsCubit>().emitDetailsStates(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final id = widget.id;

    return Column(
      children: [
        BlocListener<DetailsCubit, DetailsState>(
            listenWhen: (previous, current) =>
                current is Loading || current is Success || current is Error,
            listener: (context, state) {
              state.whenOrNull(success: (response) {
                setState(() {
                  if (response is DetailsResponse) {
                    isFavorite = response.data!;
                  } else {
                    isFavorite = !isFavorite;
                  }
                });
              });
            },
            child: const SizedBox.shrink()),
        IconButton(
            onPressed: () {
              if (isFavorite) {
                context.read<DetailsCubit>().deleteFavorite(id);
              } else {
                context.read<DetailsCubit>().addFavorite(id);
              }
            },
            icon: SvgPicture.asset(isFavorite
                ? 'assets/svgs/heart_solid_icon.svg'
                : 'assets/svgs/heart_regular_icon.svg')),
      ],
    );
  }
}
