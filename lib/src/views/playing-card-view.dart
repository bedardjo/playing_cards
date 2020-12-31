import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ValueAndSuit extends StatelessWidget {
  final String valueText;
  final Color valueTextColor;
  final TextStyle valueStyle;
  final Widget Function(BuildContext context) valueBuilder;
  final Widget Function(BuildContext context) suitBuilder;

  const ValueAndSuit(
      {Key key,
      this.valueText,
      this.valueTextColor,
      this.valueStyle,
      this.valueBuilder,
      this.suitBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          valueBuilder != null
              ? FittedBox(fit: BoxFit.fitWidth, child: valueBuilder(context))
              : Text(
                  valueText,
                  style: valueStyle,
                ),
          suitBuilder(context)
        ],
      );
}

double getIdealFontSize(String text, TextStyle style, double fitWidth) {
  TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr);
  textPainter.layout(minWidth: 0, maxWidth: double.infinity);

  double minSize = style.fontSize;
  double maxSize = style.fontSize;

  if (textPainter.size.width < fitWidth) {
    while (textPainter.size.width < fitWidth) {
      minSize = style.fontSize;
      maxSize = style.fontSize * 2;
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
      minSize = style.fontSize / 2;
      style = style.copyWith(fontSize: minSize);
      textPainter = TextPainter(
          text: TextSpan(text: text, style: style),
          maxLines: 1,
          textDirection: TextDirection.ltr);
      textPainter.layout(minWidth: 0, maxWidth: double.infinity);
    }
  }

  // at this point, min is less and max is larger
  while ((maxSize - minSize) > 3.0) {
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

class PlayingCardView extends StatelessWidget {
  final String valueText;
  final TextStyle valueTextStyle;
  final Widget Function(BuildContext context) valueBuilder;
  final Widget Function(BuildContext context) suitBuilder;
  final Widget Function(BuildContext context) center;

  const PlayingCardView(
      {Key key,
      this.valueText,
      this.valueTextStyle,
      this.valueBuilder,
      this.suitBuilder,
      this.center})
      : super(key: key);

  @override
  Widget build(BuildContext context) => AspectRatio(
      aspectRatio: 0.7142,
      child: LayoutBuilder(builder: (context, constraints) {
        double width = constraints.hasBoundedWidth
            ? constraints.maxWidth
            : constraints.maxHeight * 0.7142;
        double height = constraints.hasBoundedHeight
            ? constraints.maxHeight
            : constraints.maxWidth / 0.7142;
        TextStyle style = valueBuilder == null
            ? valueTextStyle.copyWith(
                fontSize: getIdealFontSize("A", valueTextStyle, (width * .12)))
            : null;
        return Card(
            child: Padding(
                padding: EdgeInsets.all(width * .02),
                child: Row(children: [
                  Flexible(
                      flex: 1,
                      child: ValueAndSuit(
                          valueText: valueText,
                          valueStyle: style,
                          valueBuilder: valueBuilder,
                          suitBuilder: suitBuilder)),
                  Flexible(
                      flex: 6,
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: height * .1, horizontal: width * .02),
                          child: center(context))),
                  Flexible(
                      flex: 1,
                      child: RotatedBox(
                          quarterTurns: 2,
                          child: ValueAndSuit(
                              valueText: valueText,
                              valueStyle: style,
                              valueBuilder: valueBuilder,
                              suitBuilder: suitBuilder))),
                ])));
      }));
}

class RankCardCenter extends StatelessWidget {
  final int rank;
  final Widget Function(BuildContext context) suitBuilder;

  const RankCardCenter({Key key, this.rank, this.suitBuilder})
      : super(key: key);

  Widget sideColumn(BuildContext context, double suitHeight) {
    if (rank < 4) {
      return Column(children: []);
    } else if (rank < 6) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(height: suitHeight, child: suitBuilder(context)),
          RotatedBox(
              quarterTurns: 2,
              child: Container(height: suitHeight, child: suitBuilder(context)))
        ],
      );
    } else if (rank < 9) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(height: suitHeight, child: suitBuilder(context)),
          Container(height: suitHeight, child: suitBuilder(context)),
          RotatedBox(
              quarterTurns: 2,
              child: Container(height: suitHeight, child: suitBuilder(context)))
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(height: suitHeight, child: suitBuilder(context)),
          Container(height: suitHeight, child: suitBuilder(context)),
          RotatedBox(
              quarterTurns: 2,
              child:
                  Container(height: suitHeight, child: suitBuilder(context))),
          RotatedBox(
              quarterTurns: 2,
              child: Container(height: suitHeight, child: suitBuilder(context)))
        ],
      );
    }
  }

  Widget middleColumn(BuildContext context, double suitHeight) {
    if (rank == 1 || rank == 5 || rank == 9) {
      return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(height: suitHeight, child: suitBuilder(context))
      ]);
    } else if (rank == 2) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(height: suitHeight, child: suitBuilder(context)),
            RotatedBox(
                quarterTurns: 2,
                child:
                    Container(height: suitHeight, child: suitBuilder(context)))
          ]);
    } else if (rank == 3) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(height: suitHeight, child: suitBuilder(context)),
            Container(height: suitHeight, child: suitBuilder(context)),
            RotatedBox(
                quarterTurns: 2,
                child:
                    Container(height: suitHeight, child: suitBuilder(context)))
          ]);
    } else if (rank == 7) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(height: suitHeight, child: suitBuilder(context)),
            SizedBox()
          ]);
    } else if (rank == 8) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(height: suitHeight, child: suitBuilder(context)),
            RotatedBox(
                quarterTurns: 2,
                child:
                    Container(height: suitHeight, child: suitBuilder(context)))
          ]);
    } else if (rank == 10) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(height: suitHeight, child: suitBuilder(context)),
            RotatedBox(
                quarterTurns: 2,
                child:
                    Container(height: suitHeight, child: suitBuilder(context)))
          ]);
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [],
    );
  }

  @override
  Widget build(BuildContext context) =>
      LayoutBuilder(builder: (context, constraints) {
        double suitHeight = constraints.maxHeight / 4.5;
        return Row(
          children: [
            Expanded(child: sideColumn(context, suitHeight)),
            Expanded(child: middleColumn(context, suitHeight)),
            Expanded(child: sideColumn(context, suitHeight))
          ],
        );
      });
}
