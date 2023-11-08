import 'package:bloc_demo/presentation/onboarding/onboarding/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';
import 'event.dart';

Widget onBoardingBottomBar(
    BuildContext context,
    PageController pageController,
    OnboardingState viewState,
    Function(OnboardingEvent) add
    ) {

  return Container(
    color: ColorManager.white,
    height: AppSize.s100,
    child: Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              add(OnBoardingEventSkip());
            },
            child: Text(
              AppStrings.skip,
              style: Theme.of(context).textTheme.subtitle2,
              textAlign: TextAlign.end,
            ),
          ),
        ),
        _getBottomWidget(context, pageController, viewState, add),
      ],
    ),
  );
}

Widget _getBottomWidget(
    BuildContext context,
    PageController pageController,
    OnboardingState viewState,
    Function(OnboardingEvent) add
    ) {
  return Container(
    color: ColorManager.primary,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              onTap: () {
                add(OnBoardingEventPrevious());
              },
              child: SizedBox(
                  height: AppSize.s20,
                  width: AppSize.s20,
                  child: SvgPicture.asset(ImageAssets.leftArrow)
              ),
            )
        ),
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
              onTap: () {
                if (viewState.currentIndex == 3) {
                  add(OnBoardingEventFinish());
                } else {
                  add(OnBoardingEventNext());
                }
              },
              child: SizedBox(
                  height: AppSize.s20,
                  width: AppSize.s20,
                  child: SvgPicture.asset(ImageAssets.rightArrow)
              ),
            )
        )
      ],
    ),
  );
}

Widget _getIndicator(int index, OnboardingState viewState) {
  return SvgPicture.asset(
      index == viewState.currentIndex ? ImageAssets.hollowCircle : ImageAssets.solidCircle
  );
}
