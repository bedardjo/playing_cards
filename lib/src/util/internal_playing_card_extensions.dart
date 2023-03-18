import 'package:playing_cards/src/model/card_value.dart';

extension CardValueExtension on CardValue {
  String get shortName {
    switch (this) {
      case CardValue.two:
        return "2";
      case CardValue.three:
        return "3";
      case CardValue.four:
        return "4";
      case CardValue.five:
        return "5";
      case CardValue.six:
        return "6";
      case CardValue.seven:
        return "7";
      case CardValue.eight:
        return "8";
      case CardValue.nine:
        return "9";
      case CardValue.ten:
        return "I0";
      case CardValue.jack:
        return "J";
      case CardValue.queen:
        return "Q";
      case CardValue.king:
        return "K";
      case CardValue.ace:
        return "A";
      case CardValue.joker_1:
      case CardValue.joker_2:
        return "JOKER";
    }
  }

  int get rank {
    switch (this) {
      case CardValue.ace:
        return 1;
      case CardValue.two:
        return 2;
      case CardValue.three:
        return 3;
      case CardValue.four:
        return 4;
      case CardValue.five:
        return 5;
      case CardValue.six:
        return 6;
      case CardValue.seven:
        return 7;
      case CardValue.eight:
        return 8;
      case CardValue.nine:
        return 9;
      case CardValue.ten:
        return 10;
      case CardValue.jack:
        return 11;
      case CardValue.queen:
        return 12;
      case CardValue.king:
        return 13;
      case CardValue.joker_1:
        return 14;
      case CardValue.joker_2:
        return 15;
    }
  }
}
