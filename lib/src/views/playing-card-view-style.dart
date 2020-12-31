import 'package:flutter/widgets.dart';

class PlayingCardViewStyle {
  final Widget Function(BuildContext context) clubWidget;
  final Widget Function(BuildContext context) diamondWidget;
  final Widget Function(BuildContext context) heartWidget;
  final Widget Function(BuildContext context) spadeWidget;

  final Widget Function(BuildContext context) jackOfClubsWidget;
  final Widget Function(BuildContext context) jackOfDiamondsWidget;
  final Widget Function(BuildContext context) jackOfHeartsWidget;
  final Widget Function(BuildContext context) jackOfSpadesWidget;

  PlayingCardViewStyle(
      {this.clubWidget,
      this.diamondWidget,
      this.heartWidget,
      this.spadeWidget,
      this.jackOfClubsWidget,
      this.jackOfDiamondsWidget,
      this.jackOfHeartsWidget,
      this.jackOfSpadesWidget});
}
