import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app_sonali/class15/class15_page.dart';

void main() {
  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows you to build and interact
  // with widgets in the test environment.
  testWidgets('Class15Page widget test', (WidgetTester tester) async {
    // Test code goes here.
    await tester.pumpWidget(const MaterialApp(home: Class15Page()));
    expect(find.text('Class 15'), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}