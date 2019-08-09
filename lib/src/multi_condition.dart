import 'package:flutter/widgets.dart';

/// MatchCondition will return the Widget of the Case that has the first positive condition.
class MatchCondition extends StatelessWidget {
  /// Creates a new MatchCondition
  MatchCondition({@required this.cases, @required this.elseCase});

  /// The cases to test against.
  final List<Case> cases;

  /// The Widget to show when non of the cases match.
  final Widget elseCase;

  @override
  Widget build(BuildContext context) {
    for (var c in cases) {
      if (c.condition) return c.widget;
    }
    return elseCase;
  }
}

class Case {
  final bool condition;
  final Widget widget;

  Case({@required this.condition, @required this.widget});
}
