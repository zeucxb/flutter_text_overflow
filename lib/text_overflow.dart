library text_overflow;

import 'package:flutter/material.dart';

class TextOverflow {
  static Size textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text.toUpperCase(), style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);

    return textPainter.size;
  }

  static double mediumCharsWidth(String text, TextStyle style) =>
      textSize(text, style).width / text.length;

  static int maxStringLength(double charWidth, double limitWidth) =>
      (limitWidth ~/ charWidth);

  static String limiter(String str, int limit) =>
      str.substring(0, limit).trim();

  static String handleLimiter(String str, int limit) =>
      str.length > limit ? limiter(str, limit) : str;

  static String handleLimiterFromTextWidthAndStyle(
      String str, double limitWidth, TextStyle textStyle) {
    final charWidth = mediumCharsWidth(str, textStyle);

    final maxStringLength = TextOverflow.maxStringLength(charWidth, limitWidth);

    return handleLimiter(str, maxStringLength);
  }

  static String handleLimiterWithEllipsis(String str, int limit) =>
      str.length > limit ? '${limiter(str, limit - 3)}...' : str;

  static String handleLimiterWithEllipsisFromTextWidthAndStyle(
      String str, double limitWidth, TextStyle textStyle) {
    final charWidth = mediumCharsWidth(str, textStyle);

    final maxStringLength = TextOverflow.maxStringLength(charWidth, limitWidth);

    return handleLimiterWithEllipsis(str, maxStringLength);
  }
}
