import 'package:flash_eats/core/theming/styles.dart';
import 'package:flash_eats/features/favorite/logic/cubit/favorite_cubit.dart';
import 'package:flash_eats/features/favorite/ui/widgets/favorite_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    context.read<FavoriteCubit>().emitFavoriteStates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        title: Text(
          "My favorites",
          style: TextStyles.font18BlackBold,
        ),
      ),
      body: const SafeArea(child: FavoriteBlocBuilder()),
    );
  }
}
