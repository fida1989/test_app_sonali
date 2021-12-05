import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:test_app_sonali/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('sonali test app integration test',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(Duration(seconds: 2));

    expect(find.text('Class 15'), findsNWidgets(2));
     await tester.pumpAndSettle(Duration(seconds: 2));
    expect(find.byType(ElevatedButton), findsOneWidget);
    });
  });
}