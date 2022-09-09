import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:playing_cards/src/util/card-aspect-ratio.dart';
import 'package:playing_cards/src/util/get-good-font-size.dart';

class PlayingCardContentView extends StatelessWidget {
  final String? valueText;
  final TextStyle? valueTextStyle;
  final Widget Function(BuildContext context)? suitBuilder;
  final Widget Function(BuildContext context)? center;

  const PlayingCardContentView(
      {Key? key,
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
        double suitHeight = height * 0.160714;
        double labelSuitHeight = suitHeight / 2.0;
        double topOffset = height * 0.030714;

        TextStyle ts = valueTextStyle!.copyWith(
            fontSize: getGoodFontSize("I0", valueTextStyle!, sideSpace * .9,
                fitByHeight: false));

        List<Widget> labelAndSuit = [
          Text(valueText!,
              style: ts,
              maxLines: 1,
              softWrap: false,
              textAlign: TextAlign.center),
          Container(
              height: labelSuitHeight,
              width: sideSpace,
              child: suitBuilder!(context)),
        ];
        Widget cornerContainer = Column(children: labelAndSuit);

        return Stack(children: [
          Align(
              alignment: Alignment(0, 0),
              child: Container(
                  width: innerWidth,
                  height: innerHeight,
                  child: center != null ? center!(context) : Container())),
          // Top label and suit
          Positioned(
            left: 0,
            top: topOffset,
            width: sideSpace,
            child: cornerContainer,
          ),
          // Bottom label and suit
          Positioned(
            right: 0,
            bottom: topOffset,
            width: sideSpace,
            child: RotatedBox(
              quarterTurns: 2,
              child: cornerContainer,
            ),
          ),
        ]);
      });
}
