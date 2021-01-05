import 'package:flutter/widgets.dart';

class RankCardCenter extends StatelessWidget {
  final int rank;
  final Widget Function(BuildContext context) suitBuilder;

  const RankCardCenter(
      {Key? key, required this.rank, required this.suitBuilder})
      : super(key: key);

  Widget sideColumn(Widget suit, Widget uSuit) {
    if (rank < 4) {
      return Column(children: []);
    } else if (rank < 6) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [suit, uSuit],
      );
    } else if (rank < 9) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [suit, suit, uSuit],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [suit, suit, uSuit, uSuit],
      );
    }
  }

  Widget middleColumn(Widget suit, Widget uSuit) {
    if (rank == 1 || rank == 5 || rank == 9) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.center, children: [suit]);
    } else if (rank == 2) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [suit, uSuit]);
    } else if (rank == 3) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [suit, suit, uSuit]);
    } else if (rank == 7) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [suit, SizedBox()]);
    } else if (rank == 8) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [suit, uSuit]);
    } else if (rank == 10) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [suit, uSuit]);
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [],
    );
  }

  @override
  Widget build(BuildContext context) =>
      LayoutBuilder(builder: (context, constraints) {
        double suitHeight = constraints.maxHeight / 5;
        Widget suitWidget =
            Container(height: suitHeight, child: suitBuilder(context));
        Widget upsideDownSuitWidget =
            RotatedBox(quarterTurns: 2, child: suitWidget);
        return Row(
          children: [
            Expanded(child: sideColumn(suitWidget, upsideDownSuitWidget)),
            Expanded(child: middleColumn(suitWidget, upsideDownSuitWidget)),
            Expanded(child: sideColumn(suitWidget, upsideDownSuitWidget))
          ],
        );
      });
}
