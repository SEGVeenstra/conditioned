import 'package:conditioned/conditioned.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _myNumberNotifier = ValueNotifier<double>(0.0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conditioned Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Conditioned Demo'),
        ),
        body: Column(
          children: <Widget>[
            ValueListenableBuilder<double>(
              valueListenable: _myNumberNotifier,
              builder: (context, myNumber, child) => Column(
                children: <Widget>[
                  Conditioned(
                    cases: [
                      Case(myNumber < 25, builder: () => Icon(Icons.ac_unit)),
                      Case(myNumber < 50, builder: () => Icon(Icons.home)),
                      Case(myNumber < 75, builder: () => Icon(Icons.wb_cloudy)),
                    ],
                    defaultBuilder: () => Icon(Icons.wb_sunny),
                  ),
                  Conditioned.boolean(
                    myNumber > 50,
                    trueBuilder: () => Icon(Icons.airplanemode_active),
                    falseBuilder: () => Icon(Icons.directions_car),
                  ),
                  Conditioned.equality<int>(
                    myNumber.round(),
                    values: [
                      Value(100, builder: () => Icon(Icons.wb_sunny)),
                      Value(0, builder: () => Icon(Icons.add_a_photo))
                    ],
                    defaultBuilder: () => Icon(Icons.ac_unit),
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
          ],
        ),
      ),
    );
  }
}
