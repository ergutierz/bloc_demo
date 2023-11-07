import 'package:bloc_demo/presentation/onboarding/onboarding_bottom_navigation_bar.dart';
import 'package:bloc_demo/presentation/onboarding/onboarding_viewmodel.dart';
import 'package:bloc_demo/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../resources/color_manager.dart';
import 'onboarding_page.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {

  final OnBoardingViewModel _viewModel = OnBoardingViewModel();
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    super.dispose();
    _viewModel.onIntent(OnBoardingIntentDispose());
  }

  @override
  void initState() {
    super.initState();
    _viewModel.modelStore.viewState.listen((viewState) {
      int x = viewState.currentIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<OnBoardingViewState>(
        stream: _viewModel.modelStore.viewState,
        builder: (context, viewState) {
          return _content(context, viewState.data);
        }
    );
  }

  Widget _content(BuildContext context, OnBoardingViewState? viewState) {
    if (viewState != null) {
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
            itemCount: viewState.pagerDecorator.pages.length,
            onPageChanged: (int index) {
              setState(() {
                viewState.currentIndex = index;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return OnBoardingPage(page: viewState.pagerDecorator.pages[index]);
            },
          ),
          bottomNavigationBar: onBoardingNavigationBar(context, _pageController, viewState)
      );
    } else {
      return Container();
    }
  }
}
