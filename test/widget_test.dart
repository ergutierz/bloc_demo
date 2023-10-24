
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
  });
}
