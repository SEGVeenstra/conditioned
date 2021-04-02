import 'package:flutter/widgets.dart';

/// Used to configure the [Condition] Widget by providing an [expression] and
/// a [builder]. [Condition] will show the provided [builder] when the
/// [expression] results in true.
class Case {
  final bool expression;
  final Widget Function() builder;

  Case(this.expression, {required this.builder});
}
