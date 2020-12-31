import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  Widget build(BuildContext context) => PlayingCardCardView(
      childBuilder: (context, size) => Row(children: [
            Flexible(
                flex: 1,
                child: ValueAndSuit(
                    valueText: valueText,
                    valueStyle: valueTextStyle,
                    valueBuilder: valueBuilder,
                    suitBuilder: suitBuilder)),
            Flexible(
                flex: 6,
                child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * .1,
                        horizontal: size.width * .02),
                    child: center(context))),
            Flexible(
                flex: 1,
                child: RotatedBox(
                    quarterTurns: 2,
                    child: ValueAndSuit(
                        valueText: valueText,
                        valueStyle: valueTextStyle,
                        valueBuilder: valueBuilder,
                        suitBuilder: suitBuilder)))
          ]));
}
