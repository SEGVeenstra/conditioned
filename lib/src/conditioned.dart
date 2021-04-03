import 'package:conditioned/conditioned.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FilterEntry<T> {
  final T value;
  final Widget Function() builder;

  FilterEntry(this.value, {required this.builder});
}

class Conditioned extends StatelessWidget {
  final Widget child;

  Conditioned._(this.child);

  Conditioned.boolean(bool condition,
      {required Widget Function() trueBuilder,
      required Widget Function() falseBuilder})
      : child = condition ? trueBuilder() : falseBuilder();

  Conditioned.when({
    required List<Case> cases,
    required Widget Function() defaultCase,
  }) : child = cases
            .firstWhere((element) => element.expression,
                orElse: () => Case(true, builder: defaultCase))
            .builder();

  static Conditioned? whenTrue(
    bool condition,
    Widget Function() builder,
  ) {
    return condition ? Conditioned._(builder()) : null;
  }

  static List<Widget> filterBy<T>({
    required bool Function(T value) function,
    required List<FilterEntry<T>> entries,
  }) {
    return entries
        .where((c) => function(c.value))
        .map((e) => e.builder())
        .toList();
  }

  static List<Widget> filter({
    required List<FilterEntry<bool>> entries,
  }) {
    return entries.where((c) => c.value).map((e) => e.builder()).toList();
  }

  static Conditioned equality<T>(T value,
      {required Map<T, Widget Function()> cases,
      required Widget Function() defaultCase}) {
    return Conditioned._(cases[value]?.call() ?? defaultCase());
  }

  @override
  Widget build(BuildContext context) => child;
}
