import 'package:flutter/widgets.dart';
import 'package:playing_cards/src/model/card-value.dart';
import 'package:playing_cards/src/model/suit.dart';

class PlayingCardViewStyle {
  final Map<Suit, Widget Function(BuildContext context)> suitBuilders;
  final Map<Suit, Map<CardValue, Widget Function(BuildContext context)>>
      cardContentBuilders;

  final TextStyle textStyle;
  final Widget Function(BuildContext context, Size size) cardContentsBuilder;

  const PlayingCardViewStyle(
      {this.suitBuilders,
      this.cardContentBuilders,
      this.textStyle,
      this.cardContentsBuilder});
}
