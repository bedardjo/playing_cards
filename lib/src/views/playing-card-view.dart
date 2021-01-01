import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:playing_cards/src/model/playing-card.dart';
import 'package:playing_cards/src/util/card-aspect-ratio.dart';
import 'package:playing_cards/src/views/default-playing-card-styles.dart';
import 'package:playing_cards/src/views/playing-card-raw-view.dart';
import 'package:playing_cards/src/views/playing-card-view-style.dart';
import 'package:playing_cards/src/util/internal-playing-card-extensions.dart';

class PlayingCardView extends StatelessWidget {
  final PlayingCard card;
  final PlayingCardViewStyle style;

  final ShapeBorder shape;
  final double elevation;

  const PlayingCardView(
      {Key key, @required this.card, this.style, this.shape, this.elevation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    PlayingCardViewStyle reconciled = reconcileStyle(style);
    if (reconciled.cardContentsBuilder != null) {
      return AspectRatio(
          aspectRatio: playingCardAspectRatio,
          child: Card(
              shape: shape,
              elevation: elevation,
              child: reconciled.cardContentsBuilder(context)));
    } else {
      return AspectRatio(
          aspectRatio: playingCardAspectRatio,
          child: Card(
              shape: shape,
              elevation: elevation,
              child: PlayingCardRawView(
                valueText: card.value.shortName,
                valueTextStyle: reconciled.textStyle
                    .copyWith(color: reconciled.textColor[card.suit]),
                suitBuilder: reconciled.suitBuilders[card.suit],
                center: reconciled.cardContentBuilders[card.suit][card.value],
              )));
    }
  }
}
