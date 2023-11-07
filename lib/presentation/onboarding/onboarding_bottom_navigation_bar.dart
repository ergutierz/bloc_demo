import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';
import 'onboarding_viewmodel.dart';

Widget onBoardingNavigationBar(
    BuildContext context,
    PageController pageController,
    OnBoardingViewState viewState
) =>
    Container(
      color: ColorManager.white,
      height: AppSize.s100,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                AppStrings.skip,
                style: Theme.of(context).textTheme.subtitle2,
                textAlign: TextAlign.end,
              ),
            ),
          ),
          _getBottomWidget(context, pageController, viewState),
        ],
      ),
    );

Widget _getBottomWidget(
    BuildContext context,
    PageController pageController,
    OnBoardingViewState viewState
) =>
    Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: const EdgeInsets.all(AppPadding.p14),
              child: GestureDetector(
                child: SizedBox(
                    height: AppSize.s20,
                    width: AppSize.s20,
                    child: SvgPicture.asset(ImageAssets.leftArrow)),
                onTap: () {
                  pageController.previousPage(
                      duration: DurationConstants.pageTransitionDuration,
                      curve: Curves.easeIn);
                },
              )),
          Row(
            children: [
              for (int i = 0; i < 4; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: _getIndicator(i, viewState),
                )
            ],
          ),
          Padding(
              padding: const EdgeInsets.all(AppPadding.p14),
              child: GestureDetector(
                child: SizedBox(
                    height: AppSize.s20,
                    width: AppSize.s20,
                    child: SvgPicture.asset(ImageAssets.rightArrow)),
                onTap: () {
                  if (viewState.currentIndex == 3) {
                    Navigator.pushNamed(context, Routes.loginRoute);
                  } else {
                    pageController.nextPage(
                        duration: DurationConstants.pageTransitionDuration,
                        curve: Curves.easeIn);
                  }
                },
              ))
        ],
      ),
    );

Widget _getIndicator(int index, OnBoardingViewState viewState) {
  if (index != viewState.currentIndex) {
    return SvgPicture.asset(ImageAssets.solidCircle);
  } else {
    return SvgPicture.asset(ImageAssets.hollowCircle);
  }
}
