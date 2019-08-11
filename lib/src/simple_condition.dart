import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

/// Will show a child [Widget] based on the provided [expression]
class SimpleCondition extends StatelessWidget {
  SimpleCondition({@required this.expression, this.whenTrue, this.whenFalse})
      : assert(expression != null),
        assert(whenTrue != null),
        assert(whenFalse != null);

  final bool expression;
  final Widget whenTrue;
  final Widget whenFalse;

  @override
  Widget build(BuildContext context) => expression ? whenTrue : whenFalse;
}
