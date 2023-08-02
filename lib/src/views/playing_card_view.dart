import 'package:flutter/material.dart';
import 'package:playing_cards/src/model/playing_card.dart';
import 'package:playing_cards/src/util/card_aspect_ratio.dart';
import 'package:playing_cards/src/views/default_playing_card_styles.dart';
import 'package:playing_cards/src/views/playing_card_content_view.dart';
import 'package:playing_cards/src/views/playing_card_view_style.dart';
import 'package:playing_cards/src/util/internal_playing_card_extensions.dart';

/// Primary view for rendering cards. Use like this:
///
/// PlayingCardView(card: PlayingCard(Suit.diamonds, CardValue.jack))
///
/// Renders inside a Material Card with an aspect ratio
/// of 64.0/89.0 (based on the typical card size).
///
/// Card content is rendered based on passed in style. Default styles are
/// provided, which use imagery from https://commons.wikimedia.org/wiki/Category:SVG_playing_cards
class PlayingCardView extends StatelessWidget {
  /// The card being rendered. This field is required.
  final PlayingCard card;

  /// Optional style to customize the look of the card.
  final PlayingCardViewStyle? style;

  /// If true, only the back of the card is shown.
  final bool showBack;

  /// These fields are passed to the underlying material card.
  final ShapeBorder? shape;

  /// These fields are passed to the underlying material card.
  final double? elevation;

  /// Card is required. Style can be provided to override as little or as much
  /// of the cards look as you so choose.
  const PlayingCardView({
    Key? key,
    required this.card,
    this.style,
    this.showBack = false,
    this.shape,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PlayingCardViewStyle reconciled = reconcileStyle(style);
    Widget cardBody;
    if (showBack) {
      cardBody = reconciled.cardBackContentBuilder!(context);
    } else {
      cardBody = PlayingCardContentView(
        valueText: card.value.shortName,
        valueTextStyle: reconciled.suitStyles![card.suit]!.style,
        suitBuilder: reconciled.suitStyles![card.suit]!.builder,
        center:
            reconciled.suitStyles![card.suit]!.cardContentBuilders![card.value],
        suitBesideLabel: reconciled.suitBesideLabel,
      );
    }

    return AspectRatio(
      aspectRatio: playingCardAspectRatio,
      child: Card(
        shape: shape,
        elevation: elevation,
        surfaceTintColor: reconciled.surfaceTintColor,
        color: reconciled.cardBackgroundColor,
        clipBehavior: Clip.antiAlias,
        child: cardBody,
      ),
    );
  }
}
