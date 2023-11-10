import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BaseText extends StatelessWidget {
  final String textKey;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;

  // Removed the const from constructor
  BaseText(
      this.textKey, {
        Key? key,
        this.style,
        this.strutStyle,
        this.textAlign,
        this.textDirection,
        this.softWrap,
        this.overflow,
        this.textScaleFactor,
        this.maxLines,
        this.semanticsLabel,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translatedText = textKey.tr();

    return Text(
      translatedText,
      style: style,
      strutStyle: strutStyle,
      textAlign: textAlign,
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
    );
  }
}
