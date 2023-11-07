import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';

class OnBoardingPagerDecorator {

  final List<OnboardingPage> pages;
  final String skip;

  OnBoardingPagerDecorator({
    this.pages = const [],
    this.skip = '',
  });
  
  OnBoardingPagerDecorator decorate() {
    return OnBoardingPagerDecorator(
      pages: _onBoardingPages,
      skip: AppStrings.skip,
    );
  }

  final List<OnboardingPage> _onBoardingPages = [
    OnboardingPage(
      title: AppStrings.onBoardingTitle1,
      subTitle: AppStrings.onBoardingSubTitle1,
      image: ImageAssets.onBoarding1,
    ),
    OnboardingPage(
      title: AppStrings.onBoardingTitle2,
      subTitle: AppStrings.onBoardingSubTitle2,
      image: ImageAssets.onBoarding2,
    ),
    OnboardingPage(
      title: AppStrings.onBoardingTitle3,
      subTitle: AppStrings.onBoardingSubTitle3,
      image: ImageAssets.onBoarding3,
    ),
    OnboardingPage(
      title: AppStrings.onBoardingTitle4,
      subTitle: AppStrings.onBoardingSubTitle4,
      image: ImageAssets.onBoarding4,
    ),
  ];
}

class OnboardingPage {
  String title;
  String subTitle;
  String image;

  OnboardingPage({
    required this.title,
    required this.subTitle,
    required this.image,
  });
}