import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

class SimpleCondition extends StatelessWidget {
  SimpleCondition({@required this.expression, this.whenTrue, this.whenFalse});

  final bool expression;
  final Widget whenTrue;
  final Widget whenFalse;

  @override
  Widget build(BuildContext context) => expression ? whenTrue : whenFalse;
}
