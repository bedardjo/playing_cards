import 'package:flutter/widgets.dart';

/// Returns the largest fontSize where the given `text` takes no more than
/// `fitWidth` width when using the given TextStyle (except for its fontSize).
double getGoodFontSize(String text, TextStyle style, double fitWidth) {
  double bestFontSizeSoFar = style.fontSize ?? 12;

  // Returns the text's width using the bestFontSizeSoFar.
  double bestTextWidthSoFar() {
    var bestStyleSoFar = style.copyWith(fontSize: bestFontSizeSoFar);
    var textPainter = TextPainter(
      text: TextSpan(text: text, style: bestStyleSoFar),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size.width;
  }

  double? scaleBy;
  while (true) {
    var textWidth = bestTextWidthSoFar();
    if (textWidth < fitWidth) {
      if (scaleBy == .5) break; // we were shrinking, now we're too small
      scaleBy = 2.0; // we were at the start, or growing: keep growing
    } else if (textWidth > fitWidth) {
      if (scaleBy == 2.0) break; // we were growing, now we're too large
      scaleBy = 0.5; // we were at the start, or shrinking: keep shrinking
    } else {
      return bestFontSizeSoFar; // perfect fit!
    }
    bestFontSizeSoFar *= scaleBy;
  }
  // We shrank/grew past fitWidth.  Now binary search to find closest match
  double minFontSize = bestFontSizeSoFar, maxFontSize = minFontSize / scaleBy!;
  if (minFontSize > maxFontSize) {
    double temp = minFontSize;
    minFontSize = maxFontSize;
    maxFontSize = temp;
  }

  while (maxFontSize - minFontSize > 3.0) {
    bestFontSizeSoFar = (minFontSize + maxFontSize) / 2.0;
    if (bestTextWidthSoFar() < fitWidth) {
      minFontSize = bestFontSizeSoFar;
    } else {
      maxFontSize = bestFontSizeSoFar;
    }
  }

  return minFontSize; // err on the side of fitting within fitWidth
}
