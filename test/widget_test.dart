import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:untitled/main.dart';

void main() {
  testWidgets('Marocride app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MarocrideApp());
    expect(find.text('Marocride'), findsOneWidget);
  });
}