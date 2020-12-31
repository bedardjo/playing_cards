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

  final Widget Function(BuildContext context) queenOfClubsWidget;
  final Widget Function(BuildContext context) queenOfDiamondsWidget;
  final Widget Function(BuildContext context) queenOfHeartsWidget;
  final Widget Function(BuildContext context) queenOfSpadesWidget;

  final Widget Function(BuildContext context) kingOfClubsWidget;
  final Widget Function(BuildContext context) kingOfDiamondsWidget;
  final Widget Function(BuildContext context) kingOfHeartsWidget;
  final Widget Function(BuildContext context) kingOfSpadesWidget;

  final Widget Function(BuildContext context) cardContentsWidget;

  PlayingCardViewStyle(
      {this.clubWidget,
      this.diamondWidget,
      this.heartWidget,
      this.spadeWidget,
      this.jackOfClubsWidget,
      this.jackOfDiamondsWidget,
      this.jackOfHeartsWidget,
      this.jackOfSpadesWidget,
      this.queenOfClubsWidget,
      this.queenOfDiamondsWidget,
      this.queenOfHeartsWidget,
      this.queenOfSpadesWidget,
      this.kingOfClubsWidget,
      this.kingOfDiamondsWidget,
      this.kingOfHeartsWidget,
      this.kingOfSpadesWidget,
      this.cardContentsWidget});
}
