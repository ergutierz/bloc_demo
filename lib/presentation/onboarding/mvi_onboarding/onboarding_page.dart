import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/values_manager.dart';
import 'onboarding_pager_decorator.dart';

class OnBoardingPage extends StatelessWidget {
  final OnboardingPage page;

  const OnBoardingPage({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            page.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            page.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        const SizedBox(height: AppSize.s60),
        SvgPicture.asset(page.image),
      ],
    );
  }
}