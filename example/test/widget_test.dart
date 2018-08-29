// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter/material.dart';
import 'package:flutter_search_panel/flutter_search_panel.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_search_panel_example/main.dart';

void main() {
  testWidgets('Verify Flutter Search Panel', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(new MyApp());

    // Verify that platform version is retrieved.
    expect(
        find.byWidgetPredicate(
          (Widget widget) =>
              widget is FlutterSearchPanel && widget.title.startsWith('Demo Search Page'),
        ),
        findsOneWidget);
  });
}
