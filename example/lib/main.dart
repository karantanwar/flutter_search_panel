import 'package:flutter/material.dart';
import 'package:flutter_search_panel/flutter_search_panel.dart';

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
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Flutter Search Panel'),
        ),
        body: new Center(
          child: FlutterSearchPanel(
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


          ),
        ),
      ),
    );
  }
}
