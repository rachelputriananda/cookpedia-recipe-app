import 'package:cookpedia2/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('App loads smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const CookpediaApp());

    // Tunggu animasi/splash screen selesai
    await tester.pump(const Duration(seconds: 1));
  });
}