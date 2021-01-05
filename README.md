# playing_cards

The `playing_cards` package for Flutter allows you to easily render playing cards from a standard 52 card deck. Good defaults are provided out of box, but full customization is possible if a style object is provided.

## Getting Started

To import:

```dart
import 'package:playing_cards/playing_cards.dart';
```

And here is a simple usage to render a nine of clubs:

```dart
PlayingCardView(card: PlayingCard(Suit.clubs, CardValue.nine))
```

Here is an example of a fully styled deck:

```dart
PlayingCardViewStyle myCardStyles = PlayingCardViewStyle(suitBuilders: {
      Suit.spades: (context) => FittedBox(
            fit: BoxFit.fitHeight,
            child: Text(
              "💩",
              style: TextStyle(fontSize: 500),
            ),
          )
    }, textColor: {
      Suit.spades: Colors.brown,
    }, cardContentBuilders: {
      Suit.spades: {
        CardValue.jack: (context) => Image.asset("assets/jack_of_spades.png"),
        CardValue.queen: (context) => Image.asset("assets/queen_of_spades.png"),
        CardValue.king: (context) => Image.asset("assets/king_of_spades.png"),
      }
    });
```
