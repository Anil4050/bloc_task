import 'package:api_calling/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Form Submission Integration Test", (tester) async {
    app.main(); // Start your app
    await tester.pumpAndSettle();

    // Navigate to FormScreen if it's not the initial screen
    // await tester.tap(find.text('Go to Form Screen'));
    // await tester.pumpAndSettle();

    // Find and enter text
    final titleField = find.byType(TextField).at(0);
    final descField = find.byType(TextField).at(1);

    await tester.enterText(titleField, 'Test Title');
    await tester.enterText(descField, 'Test Body');

    await tester.tap(find.text("Submit"));
    await tester.pumpAndSettle();

    // Check for success SnackBar
    expect(find.textContaining("id"), findsOneWidget);
  });
}
