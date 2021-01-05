import 'package:flutter/widgets.dart';

// This widget will array the passed in children in a horizontal line.
// The children will overlap such that the available space is filled
// and an even space exists between them. Note that if enough horizontal space
// is provided, the children will not overlap at all.
class FlatCardFan extends StatelessWidget {
  final List<Widget> children;

  // Creates the flat card fan widget.
  FlatCardFan({required this.children});

  @override
  Widget build(Object context) => Stack(
        children: List.generate(
            children.length,
            (index) => Align(
                  alignment: Alignment(
                      -1.0 + (index / (children.length - 1)) * 2.0, 0),
                  child: children[index],
                )),
      );
}
