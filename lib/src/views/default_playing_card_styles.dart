import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';
import 'package:playing_cards/src/views/rank_card_center.dart';
import 'package:playing_cards/src/util/internal_playing_card_extensions.dart';

Map<Suit, Widget Function(BuildContext context)> defaultSuitBuilders = {
  Suit.clubs: (context) => Image.asset(
        "assets/card_imagery/club.png",
        package: 'playing_cards',
        filterQuality: FilterQuality.high,
      ),
  Suit.diamonds: (context) => Image.asset(
        "assets/card_imagery/diamond.png",
        package: 'playing_cards',
        filterQuality: FilterQuality.high,
      ),
  Suit.hearts: (context) => Image.asset(
        "assets/card_imagery/heart.png",
        package: 'playing_cards',
        filterQuality: FilterQuality.high,
      ),
  Suit.spades: (context) => Image.asset(
        "assets/card_imagery/spade.png",
        package: 'playing_cards',
        filterQuality: FilterQuality.high,
      ),
  Suit.joker: (context) => Container(),
};
Map<Suit, Widget Function(BuildContext context)> defaultJackBuilders = {
  Suit.clubs: (context) => Image.asset(
        "assets/card_imagery/jc.png",
        package: 'playing_cards',
        filterQuality: FilterQuality.high,
      ),
  Suit.diamonds: (context) => Image.asset(
        "assets/card_imagery/jd.png",
        package: 'playing_cards',
        filterQuality: FilterQuality.high,
      ),
  Suit.hearts: (context) => Image.asset(
        "assets/card_imagery/jh.png",
        package: 'playing_cards',
        filterQuality: FilterQuality.high,
      ),
  Suit.spades: (context) => Image.asset(
        "assets/card_imagery/js.png",
        package: 'playing_cards',
        filterQuality: FilterQuality.high,
      ),
};

var defaultBwJokerBuilder = (context) => Image.asset(
      "assets/card_imagery/bw_joker.png",
      package: 'playing_cards',
      filterQuality: FilterQuality.high,
    );
var defaultColorJokerBuilder = (context) => Image.asset(
      "assets/card_imagery/color_joker.png",
      package: 'playing_cards',
      filterQuality: FilterQuality.high,
    );

Map<Suit, Widget Function(BuildContext context)> defaultQueenBuilders = {
  Suit.clubs: (context) => Image.asset(
        "assets/card_imagery/qc.png",
        package: 'playing_cards',
        filterQuality: FilterQuality.high,
      ),
  Suit.diamonds: (context) => Image.asset(
        "assets/card_imagery/qd.png",
        package: 'playing_cards',
        filterQuality: FilterQuality.high,
      ),
  Suit.hearts: (context) => Image.asset(
        "assets/card_imagery/qh.png",
        package: 'playing_cards',
        filterQuality: FilterQuality.high,
      ),
  Suit.spades: (context) => Image.asset(
        "assets/card_imagery/qs.png",
        package: 'playing_cards',
        filterQuality: FilterQuality.high,
      ),
};
Map<Suit, Widget Function(BuildContext context)> defaultKingBuilders = {
  Suit.clubs: (context) => Image.asset(
        "assets/card_imagery/kc.png",
        package: 'playing_cards',
        filterQuality: FilterQuality.high,
      ),
  Suit.diamonds: (context) => Image.asset(
        "assets/card_imagery/kd.png",
        package: 'playing_cards',
        filterQuality: FilterQuality.high,
      ),
  Suit.hearts: (context) => Image.asset(
        "assets/card_imagery/kh.png",
        package: 'playing_cards',
        filterQuality: FilterQuality.high,
      ),
  Suit.spades: (context) => Image.asset(
        "assets/card_imagery/ks.png",
        package: 'playing_cards',
        filterQuality: FilterQuality.high,
      ),
};

Map<CardValue, Widget Function(BuildContext context)?> getContentBuilders(
  Suit suit,
  Widget Function(BuildContext context)? suitBuilder,
  Map<CardValue, Widget Function(BuildContext context)?>? overrides,
) {
  Map<CardValue, Widget Function(BuildContext context)?> contentBuilders = {};
  for (CardValue val in [
    CardValue.ace,
    CardValue.two,
    CardValue.three,
    CardValue.four,
    CardValue.five,
    CardValue.six,
    CardValue.seven,
    CardValue.eight,
    CardValue.nine,
    CardValue.ten
  ]) {
    contentBuilders[val] = overrides != null && overrides.containsKey(val)
        ? overrides[val]
        : (context) => RankCardCenter(rank: val.rank, suitBuilder: suitBuilder);
  }
  contentBuilders[CardValue.joker_1] =
      overrides != null && overrides.containsKey(CardValue.joker_1)
          ? overrides[CardValue.joker_1]
          : defaultBwJokerBuilder;
  contentBuilders[CardValue.joker_2] =
      overrides != null && overrides.containsKey(CardValue.joker_2)
          ? overrides[CardValue.joker_2]
          : defaultColorJokerBuilder;
  contentBuilders[CardValue.jack] =
      overrides != null && overrides.containsKey(CardValue.jack)
          ? overrides[CardValue.jack]
          : defaultJackBuilders[suit];
  contentBuilders[CardValue.queen] =
      overrides != null && overrides.containsKey(CardValue.queen)
          ? overrides[CardValue.queen]
          : defaultQueenBuilders[suit];
  contentBuilders[CardValue.king] =
      overrides != null && overrides.containsKey(CardValue.king)
          ? overrides[CardValue.king]
          : defaultKingBuilders[suit];
  return contentBuilders;
}

PlayingCardViewStyle defaultPlayingCardStyles = PlayingCardViewStyle(
  suitStyles: {
    Suit.clubs: SuitStyle(
      builder: defaultSuitBuilders[Suit.clubs],
      style: const TextStyle(fontSize: 12, color: Colors.black),
      cardContentBuilders: getContentBuilders(
        Suit.clubs,
        defaultSuitBuilders[Suit.clubs],
        null,
      ),
    ),
    Suit.hearts: SuitStyle(
      builder: defaultSuitBuilders[Suit.hearts],
      style: const TextStyle(fontSize: 12, color: Colors.red),
      cardContentBuilders: getContentBuilders(
        Suit.hearts,
        defaultSuitBuilders[Suit.hearts],
        null,
      ),
    ),
    Suit.diamonds: SuitStyle(
      builder: defaultSuitBuilders[Suit.diamonds],
      style: const TextStyle(fontSize: 12, color: Colors.red),
      cardContentBuilders: getContentBuilders(
        Suit.diamonds,
        defaultSuitBuilders[Suit.diamonds],
        null,
      ),
    ),
    Suit.spades: SuitStyle(
      builder: defaultSuitBuilders[Suit.spades],
      style: const TextStyle(fontSize: 12, color: Colors.black),
      cardContentBuilders: getContentBuilders(
        Suit.spades,
        defaultSuitBuilders[Suit.spades],
        null,
      ),
    ),
    Suit.joker: SuitStyle(
      builder: defaultSuitBuilders[Suit.joker],
      style: const TextStyle(fontSize: 12, color: Colors.black),
      cardContentBuilders: getContentBuilders(
        Suit.joker,
        defaultSuitBuilders[Suit.joker],
        null,
      ),
    ),
  },
  cardBackContentBuilder: (BuildContext context) => Image.asset(
    "assets/card_imagery/back_001.png",
    fit: BoxFit.fill,
    package: 'playing_cards',
    filterQuality: FilterQuality.high,
  ),
  suitBesideLabel: false,
);

SuitStyle _reconcileSuitStyle(
  Suit suit,
  SuitStyle? defaultSuitStyle,
  SuitStyle suitStyle,
) {
  Widget Function(BuildContext context)? builder =
      suitStyle.builder ?? defaultSuitStyle!.builder;
  Map<CardValue, Widget Function(BuildContext context)?> valueBuilders =
      getContentBuilders(suit, builder, suitStyle.cardContentBuilders);
  return SuitStyle(
    builder: builder,
    style: suitStyle.style ?? defaultSuitStyle!.style,
    cardContentBuilders: valueBuilders,
  );
}

PlayingCardViewStyle reconcileStyle(PlayingCardViewStyle? style) {
  if (style == null) {
    return defaultPlayingCardStyles;
  }
  Map<Suit, SuitStyle?> suitStyles = {};
  for (Suit suit in Suit.values) {
    suitStyles[suit] =
        style.suitStyles != null && style.suitStyles!.containsKey(suit)
            ? _reconcileSuitStyle(
                suit,
                defaultPlayingCardStyles.suitStyles![suit],
                style.suitStyles![suit]!,
              )
            : defaultPlayingCardStyles.suitStyles![suit];
  }

  return PlayingCardViewStyle(
    suitStyles: suitStyles,
    cardBackContentBuilder: style.cardBackContentBuilder ??
        defaultPlayingCardStyles.cardBackContentBuilder,
    suitBesideLabel: style.suitBesideLabel ?? false,
  );
}
