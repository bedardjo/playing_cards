import 'package:playing_cards/src/model/card-value.dart';
import 'package:playing_cards/src/model/suit.dart';

class PlayingCard {
  final Suit suit;
  final CardValue value;

  PlayingCard(this.suit, this.value);
}
