import 'package:flutter/widgets.dart';
import 'package:playing_cards/src/model/card-value.dart';
import 'package:playing_cards/src/model/suit.dart';

// Create a style object if you wish to customize the look of your cards.
//
// A style is not required, however, and default styles will use imagery from
// https://commons.wikimedia.org/wiki/Category:SVG_playing_cards
class PlayingCardViewStyle {
  // Use this to override the widget for each suit.
  // These will be tiled across the cards in the standard pattern.
  final Map<Suit, Widget Function(BuildContext context)> suitBuilders;
  // Use this to override the body of the card.
  final Map<Suit, Map<CardValue, Widget Function(BuildContext context)>>
      cardContentBuilders;

  // This controls the color (for each suit) and style
  // for the card label text. Font size will be selected
  // based on card size.
  final Map<Suit, Color> textColor;
  final TextStyle textStyle;

  // The back of the card.
  final Widget Function(BuildContext context) cardBackContentBuilder;

  const PlayingCardViewStyle(
      {this.suitBuilders,
      this.cardContentBuilders,
      this.textColor,
      this.textStyle,
      this.cardBackContentBuilder});
}
