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
                  Conditioned.equality(myNumber,
                      cases: {
                        0.0: () => Text('start'),
                        100.0: () => Text('end'),
                      },
                      defaultCase: () => Text('in between')),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: Conditioned.filterBy<String>(
                      function: (value) => value.length < myNumber,
                      entries: [
                        FilterEntry('Stephan', builder: () => Text('Stephan')),
                        FilterEntry('Stefanie',
                            builder: () => Text('Stefanie')),
                        FilterEntry('Evan', builder: () => Text('Evan')),
                        FilterEntry('Stan', builder: () => Text('Stan')),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: Conditioned.filter(entries: [
                      FilterEntry(moduloResultInZero(myNumber, 3),
                          builder: () => Text('Fizz')),
                      FilterEntry(moduloResultInZero(myNumber, 5),
                          builder: () => Text('Buzz')),
                    ]),
                  ),
                  Conditioned.when(
                    cases: [
                      Case(myNumber < 25, builder: () => Icon(Icons.ac_unit)),
                      Case(myNumber < 50, builder: () => Icon(Icons.home)),
                      Case(myNumber < 75, builder: () => Icon(Icons.wb_cloudy)),
                    ],
                    defaultCase: () => Icon(Icons.wb_sunny),
                  ),
                  Conditioned.boolean(
                    myNumber > 50,
                    trueBuilder: () => Icon(Icons.airplanemode_active),
                    falseBuilder: () => Icon(Icons.directions_car),
                  ),
                  Container(
                    child: Conditioned.whenTrue(
                        myNumber > 60, () => Text('Only visible above 60!')),
                  ),
                  Text(myNumber.toStringAsFixed(1)),
                  Slider(
                    value: myNumber,
                    min: 0,
                    max: 100,
                    divisions: 100,
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

  bool moduloResultInZero(double num1, int num2) => num1 % num2 == 0;
}
