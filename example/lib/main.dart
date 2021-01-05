import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
          body: PlayingCardView(
              card: PlayingCard(Suit.spades, CardValue.jack)))));
}
