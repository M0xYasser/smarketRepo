// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:Smarket/presentation/screens/billingtscreen.dart';
import 'package:Smarket/presentation/screens/homeScreen.dart';
import 'package:Smarket/presentation/screens/onboarding_screen.dart';
import 'package:Smarket/presentation/widgets/customAppBar.dart';
import 'package:Smarket/presentation/widgets/homeBtn.dart';
import 'package:Smarket/presentation/widgets/invoices_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MyWidget has a title and message', (tester) async {
    await tester.pumpWidget(
      MaterialApp(home: BillingScreen()),
    );
    final btn = find.byKey(ValueKey("btn2"));
    await tester.tap(btn);
    await tester.pump();
    expect(
        find.widgetWithText(TextFormField, "Card Holder Name"), findsOneWidget);
  });
}
