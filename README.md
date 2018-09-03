# Flutter Search Panel

[![pub package](https://img.shields.io/badge/pub-0.0.2-orange.svg)](https://pub.dartlang.org/packages/flutter_search_panel)

A Widget to allow users to search from a list of string and make a selection (Similar to a DropDownButtom).

## Installing

```yaml
dependencies:
  flutter_search_panel: ^0.0.2
```

### Import

```dart
import 'package:flutter_search_panel/flutter_search_panel.dart';
```

## How To Use

```dart
  FlutterSearchPanel(
    padding: EdgeInsets.all(10.0),
    selected: 'a',
    title: 'Demo Search Page',
    data: ['This', 'is', 'a', 'test', 'array'],
    icon: new Icon(Icons.label, color: Colors.black),
    color: Colors.white,
    textStyle: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0, decorationStyle: TextDecorationStyle.dotted),
    onChanged: (value) {
      print(value);
    },
  )
```

## Bugs & Requests

If you encounter any bugs feel free to open an issue. Raise a ticket on github for suggestions. Pull request are also welcome.

### Flutter

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).

For help on editing plugin code, view the [documentation](https://flutter.io/platform-plugins/#edit-code).

## License

MIT License

