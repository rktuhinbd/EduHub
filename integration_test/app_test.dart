import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:eduhub/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('EduHub App Integration Test', () {
    testWidgets('Full User Flow: Onboarding -> Register -> Home',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // 1. Onboarding Screen
      // Check we are on first page
      expect(find.text('Learn Anywhere'), findsOneWidget);

      // Tap "Next" button until we reach registration
      // Page 1 -> 2
      final nextButton = find.byIcon(Icons.arrow_forward);
      await tester.tap(nextButton);
      await tester.pumpAndSettle();

      // Page 2 -> 3
      await tester.tap(nextButton);
      await tester.pumpAndSettle();

      // Page 3 -> 4
      await tester.tap(nextButton);
      await tester.pumpAndSettle();

      // Page 4 -> Register
      await tester.tap(nextButton);
      await tester.pumpAndSettle();

      // 2. Registration Screen
      expect(find.text('Create Account'), findsOneWidget);

      // Enter details
      await tester.enterText(
          find.ancestor(
              of: find.text('Full Name'), matching: find.byType(TextField)),
          'Test User');
      await tester.enterText(
          find.ancestor(
              of: find.text('Email'), matching: find.byType(TextField)),
          'test@example.com');
      await tester.enterText(
          find.ancestor(
              of: find.text('Phone Number'), matching: find.byType(TextField)),
          '1234567890');
      await tester.enterText(
          find.ancestor(
              of: find.text('Password'), matching: find.byType(TextField)),
          'password123');

      // Tap Register
      await tester.tap(find.text('Register'));

      // Wait for mock API delay (2 seconds)
      await tester.pump(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      // 3. Home Screen (Courses)
      // Expect to see main content after registration redirection
      expect(find.text('Courses'), findsOneWidget);
    });
  });
}
