import 'package:flutter/widgets.dart';

/// This widget will array the passed in children in a horizontal line.
/// The children will overlap such that the available space is filled
/// and an even space exists between them. Note that if enough horizontal space
/// is provided, the children will not overlap at all.
class FlatCardFan extends StatelessWidget {
  /// Children of the flat fan. Will be arrayed evenly (and potentially stacked) across the width.
  /// Renders from first to last, so the last child will be on top.
  final List<Widget> children;

  /// Creates a flat card fan.
  const FlatCardFan({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(Object context) {
    return Stack(
      children: List.generate(
        children.length,
        (index) => Align(
          alignment: Alignment(
            children.length > 1
                ? -1.0 + (index / (children.length - 1)) * 5.0
                : 0,
            0,
          ),
          child: children[index],
        ),
      ),
    );
  }
}
