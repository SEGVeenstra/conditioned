import 'package:flutter/widgets.dart';

/// Used to configure the [SwitchCondition] [Widget].
/// The [value] will be compared to the [value] of the [SwitchCondition].
/// If the values are equal the provided [builder] will be shown.
class Value<T> {
  final T value;
  final Widget Function() builder;

  Value(this.value, {required this.builder});
}
