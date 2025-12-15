import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:eduhub/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('verify login screen loads', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.text('Login'), findsWidgets); // App bar and button
  });
}
