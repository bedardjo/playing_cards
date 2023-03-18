import 'package:playing_cards/src/model/card_value.dart';
import 'package:playing_cards/src/model/suit.dart';

// Simple card model.
class PlayingCard {
  // The suit of the card.
  final Suit suit;
  // The rank of the card. ace->king.
  final CardValue value;

  // Creates a playing card.
  PlayingCard(this.suit, this.value);
}
