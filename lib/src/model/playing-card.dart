import 'package:playing_cards/src/model/card-value.dart';
import 'package:playing_cards/src/model/suit.dart';

// Simple card model.
class PlayingCard {
  final Suit suit;
  final CardValue value;

  // Creates a playing card. Both parameters are required.
  PlayingCard(this.suit, this.value);
}
