import 'package:flutter/widgets.dart';

/// Will show the [Widget] of the first [SwitchCase] that's equal to the
/// provided [value].
/// If none of the [SwitchCases] match, the [Widget] provided as [defaultCase]
/// will be used.
class SwitchCondition<T> extends StatelessWidget {
  final T value;
  final List<SwitchCase<T>> cases;
  final Widget defaultCase;

  SwitchCondition(
      {@required this.value, @required this.cases, @required this.defaultCase})
      : assert(value != null),
        assert(cases != null),
        assert(defaultCase != null);

  @override
  Widget build(BuildContext context) {
    for (var c in cases) if (c.value == value) return c.widget;

    return defaultCase;
  }
}

/// Used to configure the [SwitchCondition] [Widget].
/// The [value] will be compared to the [value] of the [SwitchCondition].
/// If the values are equal the provided [widget] will be shown.
class SwitchCase<T> {
  final T value;
  final Widget widget;

  SwitchCase({@required this.value, @required this.widget})
      : assert(value != null),
        assert(widget != null);
}
