import 'package:flutter/widgets.dart';

class SwitchCondition<T> extends StatelessWidget {
  final T value;
  final List<SwitchCase<T>> cases;
  final Widget defaultCase;

  SwitchCondition(
      {@required this.value,
      @required this.cases,
      @required this.defaultCase}) {
    assert(defaultCase != null, 'defaultCase must return a valid Widget.');
  }

  @override
  Widget build(BuildContext context) {
    for (var c in cases) if (c.value == value) return c.widget;

    return defaultCase;
  }
}

class SwitchCase<T> {
  final T value;
  final Widget widget;

  SwitchCase({@required this.value, @required this.widget});
}
