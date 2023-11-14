import 'package:bloc_demo/presentation/onboarding/mvi_onboarding/view/onboarding_bottom_navigation_bar.dart';
import 'package:bloc_demo/presentation/onboarding/mvi_onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:bloc_demo/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/routes_manager.dart';
import 'onboarding_page.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {

  final OnBoardingViewModel _viewModel = OnBoardingViewModel();
  final ValueNotifier<OnBoardingViewState> _viewState = ValueNotifier(OnBoardingViewState());
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    super.dispose();
    _viewModel.onIntent(OnBoardingIntentDispose());
  }

  @override
  void initState() {
    _subscribeToViewState();
    _subscribeToEvents();
    super.initState();
  }

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
          itemCount: _viewState.value.pagerDecorator.pages.length,
          onPageChanged: (int index) {
            setState(() {
              _viewModel.onIntent(OnBoardingIntentUpdateIndex(index: index));
            });
          },
          itemBuilder: (BuildContext context, int index) {
            return OnBoardingPage(page: _viewState.value.pagerDecorator.pages[index]);
          },
        ),
        bottomNavigationBar: onBoardingBottomNavigationBar(context, _pageController, _viewState.value, _viewModel.onIntent)
    );
  }

  _subscribeToViewState() {
    _viewModel.modelStore.viewState.listen((viewState) => _viewState.value = viewState);
  }

  _subscribeToEvents() {
    _viewModel.modelStore.events.listen((event) {
      switch(event) {
        case OnBoardingEventNext(): _pageController.nextPage(
            duration: DurationConstants.pageTransitionDuration,
            curve: Curves.easeIn);
        case OnBoardingEventPrevious(): _pageController.previousPage(
            duration: DurationConstants.pageTransitionDuration,
            curve: Curves.easeIn);
        case OnBoardingEventSkip() || OnBoardingEventFinish(): Navigator.pushNamed(context, Routes.loginRoute);
      }
    });
  }
}
