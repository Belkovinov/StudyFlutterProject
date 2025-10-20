import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project/presentation/app.dart';

void main() {
  testWidgets("", (tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text("Hello World"), findsOneWidget);

    expect(find.text("123"), findsNothing);

    await tester.tap(find.byKey(Key("123")));
    await tester.pump();
  });
}