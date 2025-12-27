import 'package:eduhub/src/core/presentation/widgets/language_switcher.dart';
import 'package:eduhub/src/features/authentication/presentation/screens/login_screen.dart';
import 'package:eduhub/src/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:eduhub/src/l10n/generated/app_localizations.dart';

import 'package:shared_preferences/shared_preferences.dart';

// Helper to pump widgets with ProviderScope and Localization
Future<void> pumpTestWidget(WidgetTester tester, Widget child) async {
  SharedPreferences.setMockInitialValues({});
  await tester.pumpWidget(
    ProviderScope(
      child: MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('en'),
        home: child,
      ),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  group('Onboarding Screen Tests', () {
    testWidgets('Renders first page content correctly',
        (WidgetTester tester) async {
      await pumpTestWidget(tester, const OnboardingScreen());

      // Check for first page text (English)
      expect(find.text('Learn Anywhere'), findsOneWidget);
      expect(find.text('Access courses from the comfort of your home.'),
          findsOneWidget);

      // Check for Language Switcher
      expect(find.byType(LanguageSwitcher), findsOneWidget);
    });

    testWidgets('Can swipe to next page', (WidgetTester tester) async {
      await pumpTestWidget(tester, const OnboardingScreen());

      // Swipe Left
      await tester.drag(find.byType(PageView), const Offset(-500.0, 0.0));
      await tester.pumpAndSettle();

      // Check new page content
      expect(find.text('Expert Instructors'), findsOneWidget);
    });
  });

  group('Login Screen Tests', () {
    testWidgets('Renders Login elements', (WidgetTester tester) async {
      await pumpTestWidget(tester, const LoginScreen());

      expect(find.text('Welcome Back'), findsOneWidget);
      expect(find.byType(TextField), findsNWidgets(2)); // Email & Password
      // Use text containing 'Login' because Semantic/Button might differ
      expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
    });
  });
}
