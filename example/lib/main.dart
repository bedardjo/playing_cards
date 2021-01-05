import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';

void main() {
  runApp(MaterialApp(home: CardHomeView()));
}

class CardHomeView extends StatefulWidget {
  CardHomeView({Key key}) : super(key: key);

  @override
  _CardHomeViewState createState() => _CardHomeViewState();
}

class _CardHomeViewState extends State<CardHomeView> {
  Suit suit = Suit.clubs;
  CardValue value = CardValue.jack;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PlayingCardView(card: PlayingCard(suit, value)),
          Row(children: [
            DropdownButton<Suit>(
                value: suit,
                items: Suit.values
                    .map((s) =>
                        DropdownMenuItem(value: s, child: Text(s.toString())))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    suit = val;
                  });
                }),
            DropdownButton<CardValue>(
                value: value,
                items: CardValue.values
                    .map((s) =>
                        DropdownMenuItem(value: s, child: Text(s.toString())))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    value = val;
                  });
                })
          ])
        ],
      ),
    );
  }
}
