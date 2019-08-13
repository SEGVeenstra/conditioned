import 'package:condition/condition.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class SomeClass {
  String someFunction() => 'Some result';
}

class MyApp extends StatelessWidget {
  final _myNumberNotifier = ValueNotifier<double>(0.0);
  final _myObjectNotifier = ValueNotifier<SomeClass>(null);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Condition Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Condition Demo'),
        ),
        body: Column(
          children: <Widget>[
            ValueListenableBuilder<double>(
              valueListenable: _myNumberNotifier,
              builder: (context, myNumber, child) => Column(
                children: <Widget>[
                  Conditional(
                    cases: [
                      Case(
                          expression: myNumber < 25,
                          widget: Icon(Icons.ac_unit)),
                      Case(
                          expression: myNumber < 50,
                          builder: () => Icon(
                                Icons.beach_access,
                                size: 64.0,
                              )),
                      Case(
                          expression: myNumber < 75,
                          widget: Icon(
                            Icons.wb_cloudy,
                            semanticLabel: 'icon of a cloud',
                          )),
                    ],
                    defaultCase: Icon(Icons.wb_sunny),
                  ),
                  Conditional.boolean(
                    myNumber > 50,
                    trueWidget: Icon(Icons.airplanemode_active),
                    falseWidget: Icon(Icons.directions_car),
                  ),
                  SimpleCondition(
                    expression: myNumber > 50,
                    whenTrue: Text(
                      'The condition is true!',
                      style: TextStyle(color: Colors.orange[200]),
                    ),
                    whenFalse: Text(
                      'The condition is false!',
                      style: TextStyle(color: Colors.orange[800]),
                    ),
                  ),
                  Condition(
                    cases: [
                      Case(
                          expression: myNumber < 25,
                          widget: Icon(Icons.ac_unit)),
                      Case(
                          expression: myNumber < 50,
                          widget: Icon(
                            Icons.beach_access,
                            size: 64.0,
                          )),
                      Case(
                          expression: myNumber < 75,
                          widget: Icon(
                            Icons.wb_cloudy,
                            semanticLabel: 'icon of a cloud',
                          )),
                    ],
                    defaultCase: Icon(Icons.wb_sunny),
                  ),
                  SwitchCondition<double>(
                    value: myNumber,
                    cases: [
                      SwitchCase(value: 0, widget: Icon(Icons.remove)),
                      SwitchCase(value: 100, widget: Icon(Icons.add)),
                    ],
                    defaultCase: Icon(Icons.accessibility_new),
                  ),
                  Text(myNumber.toStringAsFixed(1)),
                  Slider(
                    value: myNumber,
                    min: 0,
                    max: 100,
                    onChanged: (value) => _myNumberNotifier.value = value,
                  ),
                  RaisedButton(
                    child: Text('Toggle'),
                    onPressed: () {
                      _myObjectNotifier.value =
                          _myObjectNotifier.value == null ? SomeClass() : null;
                    },
                  ),
                  ValueListenableBuilder<SomeClass>(
                    valueListenable: _myObjectNotifier,
                    builder: (context, value, child) => Conditional.boolean(
                      value == null,
                      trueWidget: Text('SomeObject is null'),
                      falseBuilder: () =>
                          Text('SomeObject says: ${value.someFunction()}'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
