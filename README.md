# package: condition

A package that contains a set of Widgets to remove ugly `if`, `if else` and `switch` statements from your layout code and keep it more consistent.

## Usage

### Simple boolean checks

For simple true/false checks you can use the `SimpleCondition` Widget.
It will not reduce your lines of code, it does however make it more readable by using the same syntax as you'd use for the rest of your layout code.

#### Sample without `SimpleCondition`

```dart
Widget build(Buildcontext context) {
    return Container(
        child: myNumber > 50
          ? Text(
              'The condition is true!',
              style: TextStyle(color: Colors.green[200]),
            )
          : Text(
              'The condition is false!',
              style: TextStyle(color: Colors.green[800]),
        ),
    );
}
```
#### Sample with `SimpleCondition`

```dart
Widget build(Buildcontext context) {
    return Container(
        child: SimpleCondition(
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
    );
}
```

### More complex use-cases

When you want to add a specific child based on a condition but a simple true/false check will not suffice, you can avoid the `if`, `else if` and `else` drama by using the `Condition` Widget.
`Condition` will embed the Widget of the first `Expression` whos condition validates as `true`.

#### Sample without `Condition`

We cannot use `if .. else if .. else` directly in our layout code. We have to propagate it to a function (not recommend) or to a new Widget.

```dart
Widget build(BuildContext context){
  return Container(
    child: _getIcon(),
  );
}

Widget _getIcon() {
  if (myNumber < 25)
    return Icon(Icons.ac_unit);
  else if (myNumber < 50)
    return Icon(Icons.beach_access);
  else if (myNumber < 75)
    return Icon(Icons.wb_cloudy);
  else
    return Icon(Icons.wb_sunny);
}
```

#### Sample with `Condition`

With the use of `Condition` you don't have to break up the tree at the point of the `if .. else if .. else`. You can break up the tree where it makes sense.

```dart
Widget build(BuildContext context) {
  return Container(
    child: Condition(
      expressions: [
        Expression(condition: myNumber < 25, widget: Icon(Icons.ac_unit)),
        Expression(condition: myNumber < 50, widget: Icon(Icons.beach_access)),
        Expression(condition: myNumber < 75, widget: Icon(Icons.wb_cloudy)),
      ],
      elseCase: Icon(Icons.wb_sunny),
    ),
  );
}
```

### Switch cases

If instead of checking for boolean conditions but want to check by equality where you would normally use a `switch`, you can use the `SwitchCondition`.

Let's say we need to build a screen based on the following information:
```dart
enum State {empty, loading, full, error}
final state = State.idle;
```

#### Sample without `SwitchCondition`

We cannot use a `switch` directly in our layout code. We have to propagate it to a function (not recommend) or to a new Widget.

```dart
Widget build(BuildContext context) {
  return Container(
    child: _getStateText(),
  );
}

Widget _getStateText() {
  switch(state) {
    case State.loading:
      return Text('The device is loading');
      break;
    case State.full:
      return Text('The device is fully loaded');
      break;
    case State.error:
      return Text('An error occured');
      break;
    default:
      return Text('The device is opperating as expected');
      break;
    }
}
```

#### Sample with `SwitchCondition`

With the use of `SwitchCondition` you don't have to break up the tree at the point of the `switch`. You can break up the tree where it makes sense.

```dart
Widget build(BuildContext context) {
  return Container(
    child: SwitchCondition<State>(
      value: state,
      cases: [
        Case(value: State.loading, widget: Text('The device is loading')),
        Case(value: State.full, widget: Text('The device is fully loaded')),
        Case(value: State.error, widget: Text('An error occured')),
      ],
      defaultCase: Text('The device is opperating as expected')
    ),
  );
}
```