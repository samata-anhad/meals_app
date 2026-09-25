import 'package:flutter_test/flutter_test.dart';
import 'package:meals_app/main.dart';

void main() {
  testWidgets('Meals app loads successfully', (WidgetTester tester) async {
    // Build the Meals app
    await tester.pumpWidget(const App());

    // Check that the main App widget exists
    expect(find.byType(App), findsOneWidget);
  });
}

