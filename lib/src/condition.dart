import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

class Condition extends StatelessWidget {

  final bool condition;
  final Widget whenTrue;
  final Widget whenFalse;

  Condition({@required this.condition,this.whenTrue, this.whenFalse});

  @override
  Widget build(BuildContext context) => condition ? whenTrue : whenFalse;
}
