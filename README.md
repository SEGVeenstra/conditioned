# package: condition

A package that contains a set of Widgets to remove ugly `if` and `if else` statements from your layout code.

## Usage

### Simple boolean checks

For simple true/false checks you can use the `Condition` Widget.
It will not reduce your lines of code, it does however make it more readable by using the same syntax as you'd use for the rest of your layout code.

#### Sample without `Condition`

```dart
myNumber > 50
  ? Text(
      'The condition is true!',
      style: TextStyle(color: Colors.green[200]),
    )
  : Text(
      'The condition is false!',
      style: TextStyle(color: Colors.green[800]),
    ),
```
#### Sample with `Condition`

```dart
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
```

### Multiple cases

When you want to add a specific child based on a condition you can avoid the `if`, `else if` and `else` drama by using the `MatchCondition` Widget.

#### Sample without `MatchCondition`

```dart
if (myNumber < 25)
  Icon(Icons.ac_unit)
else if (myNumber < 50)
  Icon(Icons.beach_access)
else if (myNumber < 75)
    Icon(Icons.wb_cloudy)
else
  Icon(Icons.wb_sunny),
```

#### Sample with `MatchCondition`

```dart
MatchCondition(
    cases: [
      Case(condition: myNumber < 25, widget: Icon(Icons.ac_unit)),
      Case(condition: myNumber < 50, widget: Icon(Icons.beach_access)),
      Case(condition: myNumber < 75, widget: Icon(Icons.wb_cloudy)),
    ],
    elseCase: Icon(Icons.wb_sunny),
  ),
```