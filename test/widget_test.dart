import 'package:flutter_test/flutter_test.dart';

import 'package:stitch_crave_cafe/main.dart';

void main() {
  testWidgets('The Hearth app launches', (WidgetTester tester) async {
    await tester.pumpWidget(const TheHearthApp());

    expect(find.text('The Hearth'), findsOneWidget);
  });
}
