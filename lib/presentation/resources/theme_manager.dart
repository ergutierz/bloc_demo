import 'package:bloc_demo/presentation/resources/styles_manager.dart';
import 'package:bloc_demo/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    hintColor: ColorManager.grey,
    cardTheme: CardTheme(
      color: ColorManager.white,
      elevation: AppSize.s4,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.white,
      elevation: AppSize.s4,
      shadowColor: ColorManager.darkPrimary,
      titleTextStyle: getTextStyleRegular(
          color: ColorManager.white,
          fontSize: FontSize.s16
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: ColorManager.primary,
      disabledColor: ColorManager.grey1,
      shape: const StadiumBorder(),
      splashColor: ColorManager.primaryOpacity70,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.primary,
        textStyle: getTextStyleRegular(color: ColorManager.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s12)),
      ),
    ),
    textTheme: TextTheme(
      displayLarge: getTextStyleBold(
          color: ColorManager.darkGrey,
          fontSize: FontSize.s24
      ),
      displayMedium: getTextStyleBold(
          color: ColorManager.darkGrey,
          fontSize: FontSize.s20
      ),
      displaySmall: getTextStyleBold(
          color: ColorManager.darkGrey,
          fontSize: FontSize.s18
      ),
      headlineMedium: getTextStyleBold(
          color: ColorManager.darkGrey,
          fontSize: FontSize.s16
      ),
      headlineSmall: getTextStyleBold(
          color: ColorManager.darkGrey,
          fontSize: FontSize.s14
      ),
      titleLarge: getTextStyleBold(
          color: ColorManager.darkGrey,
          fontSize: FontSize.s12
      ),
      titleMedium: getTextStyleMedium(
          color: ColorManager.darkGrey,
          fontSize: FontSize.s14
      ),
      titleSmall: getTextStyleMedium(
          color: ColorManager.primary,
          fontSize: FontSize.s12
      ),
      bodyLarge: getTextStyleRegular(
          color: ColorManager.darkGrey,
          fontSize: FontSize.s14
      ),
      bodyMedium: getTextStyleRegular(
          color: ColorManager.darkGrey,
          fontSize: FontSize.s12
      ),
      bodySmall: getTextStyleRegular(
          color: ColorManager.darkGrey,
          fontSize: FontSize.s10
      ),
      labelLarge: getTextStyleMedium(
          color: ColorManager.white,
          fontSize: FontSize.s14
      ),
      labelSmall: getTextStyleRegular(
          color: ColorManager.darkGrey,
          fontSize: FontSize.s10
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getTextStyleRegular(color: ColorManager.grey),
      labelStyle: getTextStyleMedium(color: ColorManager.darkGrey),
      errorStyle: getTextStyleRegular(color: ColorManager.error),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        borderSide: BorderSide(color: ColorManager.grey1, width: AppSize.s1_5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
      ),
    )
  );
}
