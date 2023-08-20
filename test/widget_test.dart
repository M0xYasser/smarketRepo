// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:Smarket/presentation/widgets/customAppBar.dart';
import 'package:Smarket/presentation/widgets/homeBtn.dart';
import 'package:Smarket/presentation/widgets/invoices_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CustomAppBar has a title', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
          home: Scaffold(
              body: CustomAppBar(child: SizedBox(), title: "Project"))),
    );
    final titleFinder = find.text("Project");

    expect(titleFinder, findsOneWidget);
  });
}
