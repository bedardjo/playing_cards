import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:playing_cards/src/util/get-ideal-font-size.dart';
import 'package:playing_cards/src/views/playing-card-card-view.dart';
import 'package:playing_cards/src/views/value-and-suit.dart';

class PlayingCardRawView extends StatelessWidget {
  final String valueText;
  final TextStyle valueTextStyle;
  final Widget Function(BuildContext context) valueBuilder;
  final Widget Function(BuildContext context) suitBuilder;
  final Widget Function(BuildContext context) center;

  const PlayingCardRawView(
      {Key key,
      this.valueText,
      this.valueTextStyle,
      this.valueBuilder,
      this.suitBuilder,
      this.center})
      : super(key: key);

  @override
  Widget build(BuildContext context) =>
      PlayingCardCardView(childBuilder: (context, size) {
        double innerWidth = size.width * 1.6875 / 2.5;
        double innerHeight = size.height * 2.8125 / 3.5;
        double sideSpace = (size.width - innerWidth) / 2.0;
        double labelHeight = size.height * 0.089285;
        double suitHeight = size.height * 0.160714;
        double labelSuitHeight = suitHeight / 2.0;

        TextStyle ts = valueBuilder == null
            ? valueTextStyle.copyWith(
                fontSize:
                    getIdealFontSize("10", valueTextStyle, sideSpace * .9))
            : valueTextStyle;
        return Stack(children: [
          Align(
              alignment: Alignment(0, 0),
              child: Container(
                  width: innerWidth,
                  height: innerHeight,
                  child: center(context))),
          Positioned(
              left: 0,
              top: size.height * 0.035714,
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
              bottom: size.height * 0.035714 + labelHeight,
              width: sideSpace,
              height: labelSuitHeight,
              child: RotatedBox(quarterTurns: 2, child: suitBuilder(context))),
          Positioned(
              right: 0,
              bottom: size.height * 0.035714,
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
              top: size.height * 0.035714 + labelHeight,
              width: sideSpace,
              height: labelSuitHeight,
              child: suitBuilder(context)),
        ]);
      });
}
