import 'package:flutter/widgets.dart';

/// MatchCondition will return the Widget of the Case that has the first positive condition.
class Condition extends StatelessWidget {
  /// Creates a new MatchCondition
  Condition({@required this.expressions, @required this.fallback});

  /// The cases to test against.
  final List<Expression> expressions;

  /// The Widget to show when non of the cases match.
  final Widget fallback;

  @override
  Widget build(BuildContext context) {
    for (var c in expressions) {
      if (c.condition) return c.widget;
    }
    return fallback;
  }
}

class Expression {
  final bool condition;
  final Widget widget;

  Expression({@required this.condition, @required this.widget});
}
