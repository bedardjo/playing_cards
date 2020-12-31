import 'package:flutter/widgets.dart';

class ValueAndSuit extends StatelessWidget {
  final String valueText;
  final TextStyle valueStyle;
  final Widget Function(BuildContext context) valueBuilder;
  final Widget Function(BuildContext context) suitBuilder;

  const ValueAndSuit(
      {Key key,
      this.valueText,
      this.valueStyle,
      this.valueBuilder,
      this.suitBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          valueBuilder != null
              ? FittedBox(fit: BoxFit.fitWidth, child: valueBuilder(context))
              : Text(
                  valueText,
                  style: valueStyle,
                ),
          suitBuilder(context)
        ],
      );
}
