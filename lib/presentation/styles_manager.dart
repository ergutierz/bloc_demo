import 'package:bloc_demo/presentation/font_manager.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle(
    {required double fontSize,
    required String fontFamily,
    required FontWeight fontWeight,
    required Color color}) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    color: color,
    fontWeight: fontWeight,
  );
}

TextStyle getTextStyleRegular(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.fontFamily,
      fontWeight: FontWeightManager.regular,
      color: color);
}

TextStyle getTextStyleMedium(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.fontFamily,
      fontWeight: FontWeightManager.medium,
      color: color);
}

TextStyle getTextStyleSemiBold(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.fontFamily,
      fontWeight: FontWeightManager.semiBold,
      color: color);
}

TextStyle getTextStyleBold(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.fontFamily,
      fontWeight: FontWeightManager.bold,
      color: color);
}

TextStyle getTextStyleLight(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.fontFamily,
      fontWeight: FontWeightManager.light,
      color: color);
}
