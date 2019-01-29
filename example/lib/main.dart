import 'package:flutter/material.dart';
import 'package:flutter_search_panel/flutter_search_panel.dart';
import 'package:flutter_search_panel/search_item.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<SearchItem<int>> data = [
      SearchItem(0, 'This'),
      SearchItem(1, 'is'),
      SearchItem(2, 'a'),
      SearchItem(3, 'test'),
      SearchItem(4, '.'),
    ];

    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Flutter Search Panel'),
        ),
        body: Center(
          child: FlutterSearchPanel<int>(
            padding: EdgeInsets.all(10.0),
            selected: 2,
            title: 'Demo with Integer',
            data: data,
            icon: new Icon(Icons.check_circle, color: Colors.white),
            color: Colors.blue,
            textStyle: new TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                decorationStyle: TextDecorationStyle.dotted),
            onChanged: (int value) {
              print(value);
            },
          ),
        ),
      ),
    );
  }
}
