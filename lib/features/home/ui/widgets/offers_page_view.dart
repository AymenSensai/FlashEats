import 'package:dots_indicator/dots_indicator.dart';
import 'package:flash_eats/core/helpers/extensions.dart';
import 'package:flash_eats/features/home/data/models/offer_response.dart';
import 'package:flash_eats/features/home/logic/cubit/home_cubit.dart';
import 'package:flash_eats/features/home/logic/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class OffersPageView extends StatefulWidget {
  const OffersPageView({super.key});

  @override
  State<OffersPageView> createState() => _OffersPageViewState();
}

class _OffersPageViewState extends State<OffersPageView> {
  final _pageController = PageController(
    initialPage: 0,
    viewportFraction: 1,
    keepPage: true,
  );
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is OffersSuccess ||
          current is OffersError ||
          current is OffersLoading,
      builder: (context, state) {
        return state.maybeWhen(
          offersLoading: () => Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: const SizedBox(height: 150)),
          offersSuccess: (response) {
            final offers = response.offers;
            return _pageView(offers);
          },
          orElse: () => Container(),
        );
      },
    );
  }

  Widget _pageView(List<OfferData> offers) {
    return Stack(
      children: [
        SizedBox(
          height: 140.h,
          child: PageView.builder(
            controller: _pageController,
            itemCount: offers.length,
            itemBuilder: (context, index) {
              final offer = offers[index];
              return _buildPageItem(offer);
            },
          ),
        ),
        Positioned(
          bottom: 10.h, // Adjust the bottom position as needed
          left: 0,
          right: 0,
          child: DotsIndicator(
            dotsCount: offers.length,
            position: _currentPage.round(),
            decorator: DotsDecorator(
              color: const Color(0xFFBBBBBB).withOpacity(0.7),
              activeColor: Colors.white,
              size: const Size.square(9.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPageItem(OfferData offer) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: context.networkImage(offer.image,
          width: MediaQuery.of(context).size.width, height: 140.h),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
