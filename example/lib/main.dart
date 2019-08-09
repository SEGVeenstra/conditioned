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
              if (myNumber < 25)
                Icon(Icons.ac_unit)
              else if (myNumber < 50)
                Icon(
                  Icons.beach_access,
                  size: 64.0,
                )
              else if (myNumber < 75)
                Icon(
                  Icons.wb_cloudy,
                  semanticLabel: 'icon of a cloud',
                )
              else
                Icon(Icons.wb_sunny),
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
                elseCase: Icon(Icons.wb_sunny),
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
