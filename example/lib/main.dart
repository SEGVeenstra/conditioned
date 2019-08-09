import 'package:condition/condition.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _myNumberNotifier = ValueNotifier<double>(0.0);

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
        body: ValueListenableBuilder<double>(
          valueListenable: _myNumberNotifier,
          builder: (context, myNumber, child) => Column(
            children: <Widget>[
              myNumber > 50
                  ? Text(
                      'The condition is true!',
                      style: TextStyle(color: Colors.green[200]),
                    )
                  : Text(
                      'The condition is false!',
                      style: TextStyle(color: Colors.green[800]),
                    ),
              Text(
                myNumber > 50
                    ? 'The condition is true!'
                    : 'The condition is false!',
                style: TextStyle(
                    color: myNumber > 50
                        ? Colors.purple[200]
                        : Colors.purple[800]),
              ),
              _createConditionText(myNumber),
              Condition(
                condition: myNumber > 50,
                whenTrue: Text(
                  'The condition is true!',
                  style: TextStyle(color: Colors.orange[200]),
                ),
                whenFalse: Text(
                  'The condition is false!',
                  style: TextStyle(color: Colors.orange[800]),
                ),
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
      ),
    );
  }

  Widget _createConditionText(double value) => value > 50
      ? Text(
          'The condition is true!',
          style: TextStyle(color: Colors.blue[200]),
        )
      : Text(
          'The condition is false!',
          style: TextStyle(color: Colors.blue[800]),
        );
}
