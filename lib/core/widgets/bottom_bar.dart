import 'package:flash_eats/core/di/dependency_injection.dart';
import 'package:flash_eats/core/theming/colors.dart';
import 'package:flash_eats/features/home/logic/cubit/home_cubit.dart';
import 'package:flash_eats/features/home/logic/cubit/location_cubit.dart';
import 'package:flash_eats/features/home/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentTabIndex = 0;

  final List _pages = [
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
    const Center(
      child: Text("Favorite"),
    ),
    const Center(
      child: Text("Orders"),
    ),
    const Center(
      child: Text("Profile"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _onTap,
        currentIndex: _currentTabIndex,
        backgroundColor: Colors.white,
        iconSize: 24,
        selectedItemColor: ColorsManager.mainOrange,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(_currentTabIndex == 0
                ? 'assets/svgs/home_solid_icon.svg'
                : 'assets/svgs/home_regular_icon.svg'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(_currentTabIndex == 1
                ? 'assets/svgs/heart_solid_icon.svg'
                : 'assets/svgs/heart_regular_icon.svg'),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(_currentTabIndex == 2
                ? 'assets/svgs/order_solid_icon.svg'
                : 'assets/svgs/order_regular_icon.svg'),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(_currentTabIndex == 3
                ? 'assets/svgs/user_solid_icon.svg'
                : 'assets/svgs/user_regular_icon.svg'),
            label: 'Profile',
          ),
        ],
      ),
      body: _pages[_currentTabIndex],
    );
  }

  _onTap(int tabIndex) {
    setState(() {
      _currentTabIndex = tabIndex;
    });
  }
}
