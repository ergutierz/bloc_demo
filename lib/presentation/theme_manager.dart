import 'package:bloc_demo/presentation/styles_manager.dart';
import 'package:bloc_demo/presentation/values_manager.dart';
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
        primary: ColorManager.primary,
        textStyle: getTextStyleRegular(color: ColorManager.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s12)),
      ),
    ),
    textTheme: TextTheme(
      headline1: getTextStyleBold(
          color: ColorManager.darkGrey,
          fontSize: FontSize.s24
      ),
      headline2: getTextStyleBold(
          color: ColorManager.darkGrey,
          fontSize: FontSize.s20
      ),
      headline3: getTextStyleBold(
          color: ColorManager.darkGrey,
          fontSize: FontSize.s18
      ),
      headline4: getTextStyleBold(
          color: ColorManager.darkGrey,
          fontSize: FontSize.s16
      ),
      headline5: getTextStyleBold(
          color: ColorManager.darkGrey,
          fontSize: FontSize.s14
      ),
      headline6: getTextStyleBold(
          color: ColorManager.darkGrey,
          fontSize: FontSize.s12
      ),
      subtitle1: getTextStyleMedium(
          color: ColorManager.darkGrey,
          fontSize: FontSize.s14
      ),
      subtitle2: getTextStyleMedium(
          color: ColorManager.darkGrey,
          fontSize: FontSize.s12
      ),
      bodyText1: getTextStyleRegular(
          color: ColorManager.darkGrey,
          fontSize: FontSize.s14
      ),
      bodyText2: getTextStyleRegular(
          color: ColorManager.darkGrey,
          fontSize: FontSize.s12
      ),
      caption: getTextStyleRegular(
          color: ColorManager.darkGrey,
          fontSize: FontSize.s10
      ),
      button: getTextStyleMedium(
          color: ColorManager.white,
          fontSize: FontSize.s14
      ),
      overline: getTextStyleRegular(
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
