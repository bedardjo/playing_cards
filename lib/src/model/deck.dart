import 'package:playing_cards/playing_cards.dart';
import 'package:playing_cards/src/model/playing-card.dart';
import 'package:playing_cards/src/model/suit.dart';

List<PlayingCard> standardFiftyTwoCardDeck() {
  List<PlayingCard> cards = [];
  for (Suit suit in Suit.values) {
    for (CardValue v in CardValue.values) {
      cards.add(PlayingCard(suit, v));
    }
  }
  return cards;
}
