import 'package:condition/condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Conditioned extends StatelessWidget {
  final List<Case> cases;

  Conditioned({@required this.cases, @required Widget Function() defaultBuilder})
      : assert(cases != null),
        assert(defaultBuilder != null) {
    this.cases.add(Case(true, builder: defaultBuilder));
  }

  Conditioned.boolean(bool condition, {Widget Function() trueBuilder, Widget Function() falseBuilder}) : cases = [] {
    cases.add(Case(condition, builder: trueBuilder));
    cases.add(Case(!condition, builder: falseBuilder));
  }

  static Conditioned equality<T>(T value, {List<Value<T>> values, Widget Function() defaultBuilder}){
    final newCases = values.map((c) => Case(value == c.value, builder: c.builder)).toList();
    return Conditioned(cases: newCases,defaultBuilder: defaultBuilder,);
  }

  @override
  Widget build(BuildContext context) {
    for (var c in cases)
      if(c.expression) return c.builder();
    throw ArgumentError('There was no valid result.');
  }
}