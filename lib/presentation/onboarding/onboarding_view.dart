import 'package:bloc_demo/presentation/resources/assets_manager.dart';
import 'package:bloc_demo/presentation/resources/strings_manager.dart';
import 'package:bloc_demo/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/color_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late final List<OnboardingSlider> _onboardingSliderList =
      _getOnboardingSliderList();

  List<OnboardingSlider> _getOnboardingSliderList() => [
        OnboardingSlider(
          title: AppStrings.onBoardingTitle1,
          subTitle: AppStrings.onBoardingSubTitle1,
          image: ImageAssets.onBoarding1,
        ),
        OnboardingSlider(
          title: AppStrings.onBoardingTitle2,
          subTitle: AppStrings.onBoardingSubTitle2,
          image: ImageAssets.onBoarding2,
        ),
        OnboardingSlider(
          title: AppStrings.onBoardingTitle3,
          subTitle: AppStrings.onBoardingSubTitle3,
          image: ImageAssets.onBoarding3,
        ),
        OnboardingSlider(
          title: AppStrings.onBoardingTitle4,
          subTitle: AppStrings.onBoardingSubTitle4,
          image: ImageAssets.onBoarding4,
        ),
      ];

  final PageController _pageController = PageController(initialPage: 0);

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _onboardingSliderList.length,
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (BuildContext context, int index) {
          return OnBoardingPage(onboardingSlider: _onboardingSliderList[index]);
        },
      ),
      bottomSheet: Container(
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
            _getBottomSheetWidget(),
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheetWidget() => Container(
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
                    _pageController.previousPage(
                        duration: DurationConstants.pageTransitionDuration,
                        curve: Curves.easeIn);
                  },
                )),
            Row(
              children: [
                for (int i = 0; i < 4; i++)
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: _getIndicator(i),
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
                    _pageController.nextPage(
                        duration: DurationConstants.pageTransitionDuration,
                        curve: Curves.easeIn);
                  },
                ))
          ],
        ),
      );

  Widget _getIndicator(int index) {
    if (index != _currentIndex) {
      return SvgPicture.asset(ImageAssets.solidCircle);
    } else {
      return SvgPicture.asset(ImageAssets.hollowCircle);
    }
  }
}

class OnboardingSlider {
  String title;
  String subTitle;
  String image;

  OnboardingSlider({
    required this.title,
    required this.subTitle,
    required this.image,
  });
}

class OnBoardingPage extends StatelessWidget {
  final OnboardingSlider onboardingSlider;

  const OnBoardingPage({Key? key, required this.onboardingSlider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            onboardingSlider.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            onboardingSlider.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        const SizedBox(height: AppSize.s60),
        SvgPicture.asset(onboardingSlider.image),
      ],
    );
  }
}
