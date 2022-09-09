import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:playing_cards/src/util/card-aspect-ratio.dart';
import 'package:playing_cards/src/util/get-good-font-size.dart';

class PlayingCardContentView extends StatelessWidget {
  final String? valueText;
  final TextStyle? valueTextStyle;
  final Widget Function(BuildContext context)? suitBuilder;
  final Widget Function(BuildContext context)? center;
  final bool? suitBesideLabel;

  const PlayingCardContentView(
      {Key? key,
      this.valueText,
      this.valueTextStyle,
      this.suitBuilder,
      this.center,
      this.suitBesideLabel})
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
        double sideOffset = 0;
        double topOffset = height * 0.030714;

        TextStyle ts = valueTextStyle!.copyWith(
            fontSize: getGoodFontSize("I0", valueTextStyle!, sideSpace * .9));

        Widget label = Text(valueText!,
            style: ts,
            maxLines: 1,
            softWrap: false,
            textAlign: TextAlign.center);
        Widget suit = Container(
          height: labelSuitHeight,
          child: suitBuilder!(context),
        );
        // Text has half-leaders that provide good spacing b/w label and suit
        Widget cornerContainer =
            Container(width: sideSpace, child: Column(children: [label, suit]));

        if (suitBesideLabel!) {
          cornerContainer = Container(
            child: Row(
              children: [label, SizedBox(width: width * 0.02), suit],
            ),
          );
          sideOffset = width * 0.036; // can't rely on centering in sideSpace
          innerWidth *= 0.90; // give clearance for suit across the top
          innerHeight *= 0.90; // maintain aspect ratio
        }

        return Stack(children: [
          Align(
              alignment: Alignment(0, 0),
              child: Container(
                  width: innerWidth,
                  height: innerHeight,
                  child: center != null ? center!(context) : Container())),
          // Top label and suit
          Positioned(
            left: sideOffset,
            top: topOffset,
            child: cornerContainer,
          ),
          // Bottom label and suit
          Positioned(
            right: sideOffset,
            bottom: topOffset,
            child: RotatedBox(
              quarterTurns: 2,
              child: cornerContainer,
            ),
          ),
        ]);
      });
}
