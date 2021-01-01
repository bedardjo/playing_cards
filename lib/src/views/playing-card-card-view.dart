import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playing_cards/src/util/card-aspect-ratio.dart';
import 'package:playing_cards/src/views/playing-card-view-style.dart';

class PlayingCardCardView extends StatelessWidget {
  final PlayingCardViewStyle style;
  final Widget Function(BuildContext context, Size size) childBuilder;

  const PlayingCardCardView({Key key, this.style, @required this.childBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) => AspectRatio(
      aspectRatio: playingCardAspectRatio,
      child: LayoutBuilder(builder: (context, constraints) {
        double width = constraints.hasBoundedWidth
            ? constraints.maxWidth
            : constraints.maxHeight * playingCardAspectRatio;
        double height = constraints.hasBoundedHeight
            ? constraints.maxHeight
            : constraints.maxWidth / playingCardAspectRatio;
        double padding = width * .02;
        return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            elevation: 6.0,
            child: childBuilder(
                context, Size(width - padding * 2.0, height - padding * 2.0)));
      }));
}
