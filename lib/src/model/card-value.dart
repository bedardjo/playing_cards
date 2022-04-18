/// Thirteen standard card ranks.
enum CardValue {
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  ten,
  jack,
  queen,
  king,
  ace,
  joker_1,
  joker_2,
}

// all CardValue values except CardValue.joker_1 and CardValue.joker_2.
const SUITED_VALUES = [
  CardValue.two,
  CardValue.three,
  CardValue.four,
  CardValue.five,
  CardValue.six,
  CardValue.seven,
  CardValue.eight,
  CardValue.nine,
  CardValue.ten,
  CardValue.jack,
  CardValue.queen,
  CardValue.king,
  CardValue.ace,
];

const JOKER_VALUES = [
  CardValue.joker_1,
  CardValue.joker_2,
];