import 'package:flash_eats/core/helpers/extensions.dart';
import 'package:flash_eats/core/routing/routes.dart';
import 'package:flash_eats/core/theming/colors.dart';
import 'package:flash_eats/core/theming/styles.dart';
import 'package:flash_eats/core/widgets/centered_title_app_bar.dart';
import 'package:flash_eats/features/profile/logic/cubit/profile_cubit.dart';
import 'package:flash_eats/features/profile/ui/widgets/logout_bloc_listener.dart';
import 'package:flash_eats/features/profile/ui/widgets/profile_row_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: centeredTitleAppBar("Profile"),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          profileRowItem(
              icon: 'assets/svgs/profile_icon.svg',
              text: 'Personal information',
              onClick: () =>
                  context.pushNamed(Routes.personalInformationScreen)),
          profileRowItem(
              icon: 'assets/svgs/address_icon.svg',
              text: 'My addresses',
              onClick: () {}),
          profileRowItem(
              icon: 'assets/svgs/notification_icon.svg',
              text: 'Notifications',
              onClick: () {}),
          profileRowItem(
              icon: 'assets/svgs/language_icon.svg',
              text: 'Languages',
              onClick: () {}),
          profileRowItem(
              icon: 'assets/svgs/help_icon.svg',
              text: 'Help and support',
              onClick: () {}),
          profileRowItem(
              icon: 'assets/svgs/star_icon.svg',
              text: 'Write a review',
              onClick: () {}),
          profileRowItem(
              icon: 'assets/svgs/about_icon.svg',
              text: 'About',
              onClick: () {}),
          profileRowItem(
              icon: 'assets/svgs/logout_icon.svg',
              text: 'Log out',
              onClick: () {
                context.read<ProfileCubit>().logout();
              },
              iconColor: ColorsManager.mainOrange,
              style: TextStyles.font16OrangeMedium),
          const LogoutBlocListener()
        ],
      ))),
    );
  }
}
