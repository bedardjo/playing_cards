import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';
import 'package:playing_cards/src/model/suit.dart';
import 'package:playing_cards/src/views/playing-card-view-style.dart';
import 'package:playing_cards/src/views/rank-card-center.dart';
import 'package:playing_cards/src/util/internal-playing-card-extensions.dart';

Map<Suit, Widget Function(BuildContext context)> defaultSuitBuilders = {
  Suit.clubs: (context) => Image.asset(
        "assets/card_imagery/club.png",
        package: 'playing_cards',
      ),
  Suit.diamonds: (context) => Image.asset(
        "assets/card_imagery/diamond.png",
        package: 'playing_cards',
      ),
  Suit.hearts: (context) => Image.asset(
        "assets/card_imagery/heart.png",
        package: 'playing_cards',
      ),
  Suit.spades: (context) => Image.asset(
        "assets/card_imagery/spade.png",
        package: 'playing_cards',
      ),
};
Map<Suit, Widget Function(BuildContext context)> defaultJackBuilders = {
  Suit.clubs: (context) => Image.asset(
        "assets/card_imagery/jc.png",
        package: 'playing_cards',
      ),
  Suit.diamonds: (context) => Image.asset(
        "assets/card_imagery/jd.png",
        package: 'playing_cards',
      ),
  Suit.hearts: (context) => Image.asset(
        "assets/card_imagery/jh.png",
        package: 'playing_cards',
      ),
  Suit.spades: (context) => Image.asset(
        "assets/card_imagery/js.png",
        package: 'playing_cards',
      ),
};
Map<Suit, Widget Function(BuildContext context)> defaultQueenBuilders = {
  Suit.clubs: (context) => Image.asset(
        "assets/card_imagery/qc.png",
        package: 'playing_cards',
      ),
  Suit.diamonds: (context) => Image.asset(
        "assets/card_imagery/qd.png",
        package: 'playing_cards',
      ),
  Suit.hearts: (context) => Image.asset(
        "assets/card_imagery/qh.png",
        package: 'playing_cards',
      ),
  Suit.spades: (context) => Image.asset(
        "assets/card_imagery/qs.png",
        package: 'playing_cards',
      ),
};
Map<Suit, Widget Function(BuildContext context)> defaultKingBuilders = {
  Suit.clubs: (context) => Image.asset(
        "assets/card_imagery/kc.png",
        package: 'playing_cards',
      ),
  Suit.diamonds: (context) => Image.asset(
        "assets/card_imagery/kd.png",
        package: 'playing_cards',
      ),
  Suit.hearts: (context) => Image.asset(
        "assets/card_imagery/kh.png",
        package: 'playing_cards',
      ),
  Suit.spades: (context) => Image.asset(
        "assets/card_imagery/ks.png",
        package: 'playing_cards',
      ),
};

Map<CardValue, Widget Function(BuildContext context)> getContentBuilders(
    Suit suit) {
  Map<CardValue, Widget Function(BuildContext context)> contentBuilders = {};
  for (CardValue val in [
    CardValue.ace,
    CardValue.two,
    CardValue.three,
    CardValue.five,
    CardValue.six,
    CardValue.seven,
    CardValue.eight,
    CardValue.nine,
    CardValue.ten
  ]) {
    contentBuilders[val] = (context) =>
        RankCardCenter(rank: val.rank, suitBuilder: defaultSuitBuilders[suit]);
  }
  contentBuilders[CardValue.jack] = defaultJackBuilders[suit];
  contentBuilders[CardValue.queen] = defaultQueenBuilders[suit];
  contentBuilders[CardValue.king] = defaultKingBuilders[suit];
  return contentBuilders;
}

PlayingCardViewStyle defaultPlayingCardStyles = PlayingCardViewStyle(
    suitBuilders: defaultSuitBuilders,
    cardContentBuilders: {
      Suit.clubs: getContentBuilders(Suit.clubs),
      Suit.diamonds: getContentBuilders(Suit.diamonds),
      Suit.hearts: getContentBuilders(Suit.hearts),
      Suit.spades: getContentBuilders(Suit.spades),
    },
    textStyle: TextStyle(fontSize: 12),
    cardContentsBuilder: null);

PlayingCardViewStyle reconcileStyle(PlayingCardViewStyle style) {
  if (style == null) {
    return defaultPlayingCardStyles;
  }
  Map<Suit, Widget Function(BuildContext)> suitBuilders = {};
  Map<Suit, Map<CardValue, Widget Function(BuildContext context)>>
      contentBuilders = {};
  for (Suit suit in Suit.values) {
    suitBuilders[suit] = style.suitBuilders.containsKey(suit)
        ? style.suitBuilders[suit]
        : defaultPlayingCardStyles.suitBuilders[suit];
    contentBuilders[suit] = {};
    for (CardValue val in CardValue.values) {
      contentBuilders[suit][val] =
          style.cardContentBuilders[suit].containsKey(val)
              ? style.cardContentBuilders[suit][val]
              : defaultPlayingCardStyles.cardContentBuilders[suit][val];
    }
  }
  TextStyle ts = style.textStyle;
  if (ts == null) {
    ts = defaultPlayingCardStyles.textStyle;
  } else if (ts.fontSize == null) {
    ts = ts.copyWith(fontSize: 12);
  }
  return PlayingCardViewStyle(
      suitBuilders: suitBuilders,
      cardContentBuilders: contentBuilders,
      textStyle: style.textStyle == null
          ? defaultPlayingCardStyles.textStyle
          : style.textStyle,
      cardContentsBuilder: style.cardContentsBuilder);
}
