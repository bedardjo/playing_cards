import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:playing_cards/src/model/playing-card.dart';
import 'package:playing_cards/src/util/card-aspect-ratio.dart';
import 'package:playing_cards/src/views/default-playing-card-styles.dart';
import 'package:playing_cards/src/views/playing-card-content-view.dart';
import 'package:playing_cards/src/views/playing-card-view-style.dart';
import 'package:playing_cards/src/util/internal-playing-card-extensions.dart';

// Primary view for rendering cards. Uses a Material Card with
// an aspect ratio of 64.0/89.0 (based on the typical card size).
//
// Card content is rendered based on passed in style. Default styles are
// provided, which use imagery from https://commons.wikimedia.org/wiki/Category:SVG_playing_cards
class PlayingCardView extends StatelessWidget {
  final PlayingCard card;
  final PlayingCardViewStyle style;

  final bool showBack;

  final ShapeBorder shape;
  final double elevation;

  const PlayingCardView(
      {Key key,
      @required this.card,
      this.style,
      this.showBack = false,
      this.shape,
      this.elevation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    PlayingCardViewStyle reconciled = reconcileStyle(style);
    Widget cardBody;
    if (showBack) {
      cardBody = reconciled.cardBackContentBuilder(context);
    } else {
      cardBody = PlayingCardContentView(
        valueText: card.value.shortName,
        valueTextStyle: reconciled.suitStyles[card.suit].style,
        suitBuilder: reconciled.suitStyles[card.suit].builder,
        center:
            reconciled.suitStyles[card.suit].cardContentBuilders[card.value],
      );
    }

    return AspectRatio(
        aspectRatio: playingCardAspectRatio,
        child: Card(
            shape: shape,
            elevation: elevation,
            clipBehavior: Clip.antiAlias,
            child: cardBody));
  }
}
