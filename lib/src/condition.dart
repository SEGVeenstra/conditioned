import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

class Condition extends StatelessWidget {

  Condition({@required this.condition,this.whenTrue, this.whenFalse});

  final bool condition;
  final Widget whenTrue;
  final Widget whenFalse;

  @override
  Widget build(BuildContext context) => condition ? whenTrue : whenFalse;
}
