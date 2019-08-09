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
              MatchCondition(
                cases: [
                  Case(condition: myNumber < 25, widget: Icon(Icons.ac_unit)),
                  Case(
                      condition: myNumber < 50,
                      widget: Icon(
                        Icons.beach_access,
                        size: 64.0,
                      )),
                  Case(
                      condition: myNumber < 75,
                      widget: Icon(
                        Icons.wb_cloudy,
                        semanticLabel: 'icon of a cloud',
                      )),
                ],
                defaultCase: Icon(Icons.wb_sunny),
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
}
