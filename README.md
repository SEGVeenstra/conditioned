# package: condition

A package that contains a set of Widgets to remove ugly `if`, `if else` and `switch` statements from your layout code and keep it more consistent.

## Usage

The `Conditioned` `Widget` is just like any other and can be used in your `Widget` tree.
`Conditioned` will have one child. What that child will be is up to you.
You will provide the cases and `Conditioned` will figure out which `builder` to call.

> Note: You will always provide a builder method that results in a Widget. Providing builders instead of Widgets is better for performance and allows us to use null objects.

### Basics

When you want to add a specific child based on a condition you can avoid the `if`, `else if` and `else` drama by using the `Conditioned` Widget.
`Conditioned` will use the `builder` of the first `Case` whos `expression` validates as `true`.

#### Without `Conditioned`

We cannot use `if .. else if .. else` directly in our layout code. We have to propagate it to a function (not recommended) or to a new Widget.

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
    return Icon(Icons.home);
  else if (myNumber < 75)
    return Icon(Icons.wb_cloudy);
  else
    return Icon(Icons.wb_sunny);
}
```

#### With `Conditioned`

With the use of `Conditioned` you don't have to break up the tree at the point of the `if .. else if .. else`. You can break up the tree where it makes sense, which is often right after the condition.

```dart
Widget build(BuildContext context) {
  return Container(
    child: Condition(
      cases: [
        Case(myNumber < 25, builder: () => Icon(Icons.ac_unit)),
        Case(myNumber < 50, builder: () => Icon(Icons.home)),
        Case(myNumber < 75, builder: () => Icon(Icons.wb_cloudy)),
      ],
      defaultBuilder: () => Icon(Icons.wb_sunny),
    ),
  );
}
```

### Simple boolean checks

For simple true/false checks you can use the `Conditioned.boolean` constructor.
It will not reduce your lines of code, it does however make it more consistent with the rest of your layout code.

#### Without `Conditioned.boolean`

```dart
Widget build(BuildContext context) {
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
#### With `Conditioned.boolean`

```dart
Widget build(BuildContext context) {
    return Container(
        child: Conditioned.boolean( myNumber > 50,
            trueBuilder: () => Text(
              'The condition is true!',
              style: TextStyle(color: Colors.orange[200]),
            ),
            falseBuilder: () => Text(
              'The condition is false!',
              style: TextStyle(color: Colors.orange[800]),
            ),
        ),
    );
}
```

### Switch cases

If instead of checking for boolean conditions but want to check by equality where you would normally want to use a `switch`, you can use the `Conditioned.equality<T>` static method.

Let's say we need to build a screen based on the following information:
```dart
enum State {empty, loading, full, error}
final state = State.idle;
```

#### Without `Conditioned.equality<T>`

We cannot use a `switch` directly in our layout code. We have to propagate it to a function (not recommended) or to a new Widget.

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
      return Text('The device is operating as expected');
      break;
    }
}
```

#### With `Conditioned.equality<T>`

With the use of `Conditioned.equality<T>` you don't have to break up the tree at the point of the `switch` or introduce a `Builder` `Widget`. You can break up the tree where it makes more sense, right after the switch for example.

```dart
Widget build(BuildContext context) {
  return Container(
    child: Conditioned.equality<State>( state,
      values: [
        Value(State.loading, builder: () => Text('The device is loading')),
        Value(State.full, builder: () => Text('The device is fully loaded')),
        Value(State.error, builder: () => Text('An error occured')),
      ],
      defaultBuilder: () => Text('The device is operating as expected')
    ),
  );
}
```