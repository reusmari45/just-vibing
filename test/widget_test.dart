import 'package:cleanflow/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Home screen renders', (tester) async {
    await tester.pumpWidget(const CleanFlowApp());
    await tester.pumpAndSettle();

    expect(find.text('Storage Analyzer'), findsNothing);
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
