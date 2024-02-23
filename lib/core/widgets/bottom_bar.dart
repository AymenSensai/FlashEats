import 'package:flash_eats/core/di/dependency_injection.dart';
import 'package:flash_eats/core/theming/colors.dart';
import 'package:flash_eats/core/theming/styles.dart';
import 'package:flash_eats/features/favorite/logic/cubit/favorite_cubit.dart';
import 'package:flash_eats/features/favorite/ui/favorite_screen.dart';
import 'package:flash_eats/features/home/logic/cubit/home_cubit.dart';
import 'package:flash_eats/features/home/logic/cubit/location_cubit.dart';
import 'package:flash_eats/features/home/ui/home_screen.dart';
import 'package:flash_eats/features/profile/logic/cubit/profile_cubit.dart';
import 'package:flash_eats/features/profile/ui/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => getIt<HomeCubit>(),
        ),
        BlocProvider(
          create: (BuildContext context) => getIt<LocationCubit>(),
        )
      ],
      child: const HomeScreen(),
    ),
    BlocProvider(
      create: (context) => getIt<FavoriteCubit>(),
      child: const FavoriteScreen(),
    ),
    const Center(
      child: Text("Orders"),
    ),
    BlocProvider(
      create: (context) => getIt<ProfileCubit>(),
      child: const ProfileScreen(),
    ),
  ];
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: _onTap,
          currentIndex: _selectedIndex,
          selectedLabelStyle: TextStyles.font10BlackRegular,
          unselectedLabelStyle: TextStyles.font10BlackRegular,
          backgroundColor: Colors.white,
          iconSize: 24,
          selectedItemColor: ColorsManager.mainOrange,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                _selectedIndex == 0
                    ? 'assets/svgs/home_solid_icon.svg'
                    : 'assets/svgs/home_regular_icon.svg',
                width: 32.w,
                height: 32.h,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                  _selectedIndex == 1
                      ? 'assets/svgs/heart_solid_icon.svg'
                      : 'assets/svgs/heart_regular_icon.svg',
                  width: 34.w,
                  height: 39.h),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                  _selectedIndex == 2
                      ? 'assets/svgs/order_solid_icon.svg'
                      : 'assets/svgs/order_regular_icon.svg',
                  width: 32.w,
                  height: 32.h),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                  _selectedIndex == 3
                      ? 'assets/svgs/user_solid_icon.svg'
                      : 'assets/svgs/user_regular_icon.svg',
                  width: 21.w,
                  height: 24.h),
              label: 'Profile',
            ),
          ],
        ),
        body: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: _onTap,
            children: _pages));
  }

  _onTap(int index) {
    if (_selectedIndex != index) {
      _pageController.jumpToPage(index);
      setState(() {
        _selectedIndex = index;
      });
    }
  }
}
