import 'package:condition/condition.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

enum State { idle, loading, full }

class MyApp extends StatelessWidget {
  final _myNumberNotifier = ValueNotifier<double>(0.0);
  final _myStateNotifier = ValueNotifier<State>(State.idle);

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
                ],
              ),
            ),
            ValueListenableBuilder<State>(
              valueListenable: _myStateNotifier,
              builder: (context, state, child) => Column(
                children: <Widget>[
                  SwitchCondition<State>(
                    value: state,
                    cases: [
                      SwitchCase(
                          value: State.idle, widget: Icon(Icons.battery_alert)),
                      SwitchCase(
                          value: State.loading,
                          widget: Icon(Icons.battery_charging_full)),
                    ],
                    defaultCase: Icon(Icons.battery_full),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      RaisedButton(
                        child: Text('Idle'),
                        onPressed: () {
                          _myStateNotifier.value = State.idle;
                        },
                      ),
                      RaisedButton(
                        child: Text('Loading'),
                        onPressed: () {
                          _myStateNotifier.value = State.loading;
                        },
                      ),
                      RaisedButton(
                        child: Text('Full'),
                        onPressed: () {
                          _myStateNotifier.value = State.full;
                        },
                      ),
                    ],
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
