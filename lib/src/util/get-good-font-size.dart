import 'package:flutter/widgets.dart';

double? getGoodFontSize(String text, TextStyle style, double fitWidth) {
  TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr);
  textPainter.layout(minWidth: 0, maxWidth: double.infinity);

  double? minSize = style.fontSize;
  double? maxSize = style.fontSize;
  if (minSize == null) {
    minSize = 12;
  }
  if (maxSize == null) {
    maxSize = 12;
  }

  if (textPainter.size.width < fitWidth) {
    while (textPainter.size.width < fitWidth) {
      minSize = style.fontSize;
      if (minSize == null) {
        minSize = 12;
      }
      maxSize = minSize * 2;
      style = style.copyWith(fontSize: maxSize);
      textPainter = TextPainter(
          text: TextSpan(text: text, style: style),
          maxLines: 1,
          textDirection: TextDirection.ltr);
      textPainter.layout(minWidth: 0, maxWidth: double.infinity);
    }
  } else {
    while (textPainter.size.width > fitWidth) {
      maxSize = style.fontSize;
      if (maxSize == null) {
        maxSize = 12;
      }
      minSize = maxSize / 2;
      style = style.copyWith(fontSize: minSize);
      textPainter = TextPainter(
          text: TextSpan(text: text, style: style),
          maxLines: 1,
          textDirection: TextDirection.ltr);
      textPainter.layout(minWidth: 0, maxWidth: double.infinity);
    }
  }

  // at this point, min is less and max is larger
  while ((maxSize! - minSize!) > 3.0) {
    double mid = minSize + (maxSize - minSize) / 2.0;
    style = style.copyWith(fontSize: mid);
    textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr);
    textPainter.layout(minWidth: 0, maxWidth: double.infinity);
    if (textPainter.size.width < fitWidth) {
      minSize = mid;
    } else {
      maxSize = mid;
    }
  }

  return minSize;
}
