import 'package:flutter/widgets.dart';

/// Will show the [Widget] of the first [Case] that has a positive
/// [expression].
/// When non of the [cases] result in true, the [Widget] provided as
/// [defaultCase] will be shown.
class Condition extends StatelessWidget {
  Condition({@required this.cases, @required this.defaultCase})
      : assert(cases != null),
        assert(defaultCase != null);

  final List<Case> cases;
  final Widget defaultCase;

  @override
  Widget build(BuildContext context) {
    for (var c in cases) {
      if (c.expression) return c.widget;
    }
    return defaultCase;
  }
}

/// Used to configure the [Condition] Widget by providing an [expression] and
/// a [Widget]. [Condition] will show the provided [widget] when the
/// [expression] results in true.
class Case {
  final bool expression;
  final Widget widget;

  Case({@required this.expression, @required this.widget})
      : assert(expression != null),
        assert(widget != null);
}
