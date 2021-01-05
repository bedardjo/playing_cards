import 'package:flutter/widgets.dart';

class FlatCardFan extends StatelessWidget {
  final List<Widget> children;

  FlatCardFan({@required this.children});

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
