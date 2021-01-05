import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:playing_cards/src/util/card-aspect-ratio.dart';
import 'package:playing_cards/src/util/get-good-font-size.dart';

class PlayingCardContentView extends StatelessWidget {
  final String valueText;
  final TextStyle valueTextStyle;
  final Widget Function(BuildContext context) suitBuilder;
  final Widget Function(BuildContext context) center;

  const PlayingCardContentView(
      {Key key,
      this.valueText,
      this.valueTextStyle,
      this.suitBuilder,
      this.center})
      : super(key: key);

  @override
  Widget build(BuildContext context) =>
      LayoutBuilder(builder: (context, constraints) {
        double width = constraints.hasBoundedWidth
            ? constraints.maxWidth
            : constraints.maxHeight * playingCardAspectRatio;
        double height = constraints.hasBoundedHeight
            ? constraints.maxHeight
            : constraints.maxWidth / playingCardAspectRatio;
        // these magic numbers are based on measurements
        // taken from a few decks of standard decks of cards.
        double innerWidth = width * 1.6875 / 2.5;
        double innerHeight = height * 2.8125 / 3.5;
        double sideSpace = (width - innerWidth) / 2.0;
        double labelHeight = height * 0.089285;
        double suitHeight = height * 0.160714;
        double labelSuitHeight = suitHeight / 2.0;

        TextStyle ts = valueTextStyle.copyWith(
            fontSize: getGoodFontSize("10", valueTextStyle, sideSpace * .9));
        return Stack(children: [
          Align(
              alignment: Alignment(0, 0),
              child: Container(
                  width: innerWidth,
                  height: innerHeight,
                  child: center(context))),
          Positioned(
              left: 0,
              top: height * 0.035714,
              width: sideSpace,
              height: labelHeight,
              child: Text(
                valueText,
                style: ts,
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
              )),
          Positioned(
              right: 0,
              bottom: height * 0.035714 + labelHeight + height * .01,
              width: sideSpace,
              height: labelSuitHeight,
              child: RotatedBox(quarterTurns: 2, child: suitBuilder(context))),
          Positioned(
              right: 0,
              bottom: height * 0.035714,
              width: sideSpace,
              height: labelHeight,
              child: RotatedBox(
                  quarterTurns: 2,
                  child: Text(
                    valueText,
                    style: ts,
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                  ))),
          Positioned(
              left: 0,
              top: height * 0.035714 + labelHeight + height * .01,
              width: sideSpace,
              height: labelSuitHeight,
              child: suitBuilder(context)),
        ]);
      });
}
