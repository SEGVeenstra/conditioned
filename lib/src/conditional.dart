import 'package:condition/condition.dart';
import 'package:flutter/widgets.dart';

class Conditional extends StatelessWidget {
  final List<Case> cases;

  Conditional({@required this.cases, @required Widget defaultCase})
      : assert(cases != null),
        assert(defaultCase != null) {
    this.cases.add(Case(expression: true, widget: defaultCase));
  }

  Conditional.boolean(bool condition, {Widget trueWidget, Widget falseWidget, Widget Function() trueBuilder, Widget Function() falseBuilder}) : cases = [] {
    cases.add(Case(expression: condition, widget: trueWidget, builder: trueBuilder));
    cases.add(Case(expression: !condition, widget: falseWidget, builder: falseBuilder));
  }

  @override
  Widget build(BuildContext context) {
    for (var c in cases)
      if(c.expression) return c.builder();
    throw Error();
  }
}
