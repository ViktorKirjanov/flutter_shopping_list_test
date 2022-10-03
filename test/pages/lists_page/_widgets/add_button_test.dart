// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_shopping_list_test/pages/lists_page/_widgets/add_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('test AddButton', () {
    testWidgets(
      'with error parameter',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AddButton(
                key: const Key('button'),
                onTap: () => print('on tap'),
              ),
            ),
          ),
        );
        expect(find.byType(AddButton), findsOneWidget);
        expect(find.byType(TextButton), findsOneWidget);
        expect(find.text('Add new list'), findsOneWidget);
        expect(find.byIcon(Icons.add_rounded), findsOneWidget);
        expectLater(
          () => tester.tap(find.byKey(const Key('button'))),
          prints('on tap\n'),
        );
      },
    );
  });
}
