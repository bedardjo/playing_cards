import 'package:flutter/widgets.dart';

class RankCardCenter extends StatelessWidget {
  final int rank;
  final Widget Function(BuildContext context) suitBuilder;

  const RankCardCenter({Key key, this.rank, this.suitBuilder})
      : super(key: key);

  Widget sideColumn(BuildContext context, double suitHeight) {
    if (rank < 4) {
      return Column(children: []);
    } else if (rank < 6) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(height: suitHeight, child: suitBuilder(context)),
          RotatedBox(
              quarterTurns: 2,
              child: Container(height: suitHeight, child: suitBuilder(context)))
        ],
      );
    } else if (rank < 9) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(height: suitHeight, child: suitBuilder(context)),
          Container(height: suitHeight, child: suitBuilder(context)),
          RotatedBox(
              quarterTurns: 2,
              child: Container(height: suitHeight, child: suitBuilder(context)))
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(height: suitHeight, child: suitBuilder(context)),
          Container(height: suitHeight, child: suitBuilder(context)),
          RotatedBox(
              quarterTurns: 2,
              child:
                  Container(height: suitHeight, child: suitBuilder(context))),
          RotatedBox(
              quarterTurns: 2,
              child: Container(height: suitHeight, child: suitBuilder(context)))
        ],
      );
    }
  }

  Widget middleColumn(BuildContext context, double suitHeight) {
    if (rank == 1 || rank == 5 || rank == 9) {
      return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(height: suitHeight, child: suitBuilder(context))
      ]);
    } else if (rank == 2) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(height: suitHeight, child: suitBuilder(context)),
            RotatedBox(
                quarterTurns: 2,
                child:
                    Container(height: suitHeight, child: suitBuilder(context)))
          ]);
    } else if (rank == 3) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(height: suitHeight, child: suitBuilder(context)),
            Container(height: suitHeight, child: suitBuilder(context)),
            RotatedBox(
                quarterTurns: 2,
                child:
                    Container(height: suitHeight, child: suitBuilder(context)))
          ]);
    } else if (rank == 7) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(height: suitHeight, child: suitBuilder(context)),
            SizedBox()
          ]);
    } else if (rank == 8) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(height: suitHeight, child: suitBuilder(context)),
            RotatedBox(
                quarterTurns: 2,
                child:
                    Container(height: suitHeight, child: suitBuilder(context)))
          ]);
    } else if (rank == 10) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(height: suitHeight, child: suitBuilder(context)),
            RotatedBox(
                quarterTurns: 2,
                child:
                    Container(height: suitHeight, child: suitBuilder(context)))
          ]);
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [],
    );
  }

  @override
  Widget build(BuildContext context) =>
      LayoutBuilder(builder: (context, constraints) {
        double suitHeight = constraints.maxHeight / 4.5;
        return Row(
          children: [
            Expanded(child: sideColumn(context, suitHeight)),
            Expanded(child: middleColumn(context, suitHeight)),
            Expanded(child: sideColumn(context, suitHeight))
          ],
        );
      });
}
