import 'package:flutter/material.dart';
import 'package:flutter_shopping_list_test/pages/_widgets/lists_error.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('test ListsError', () {
    testWidgets(
      'with error parameter',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: ListsError(
                error: 'error text',
              ),
            ),
          ),
        );

        expect(find.text('error text'), findsOneWidget);
        expect(find.text('Oops!'), findsNothing);
        expect(find.text('Refresh'), findsOneWidget);
        expect(find.byType(TextButton), findsOneWidget);
      },
    );

    testWidgets(
      'with no error parameter',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: ListsError(),
            ),
          ),
        );

        expect(find.text('error text'), findsNothing);
        expect(find.text('Oops!'), findsOneWidget);
        expect(find.text('Refresh'), findsOneWidget);
        expect(find.byType(TextButton), findsOneWidget);
      },
    );
  });
}
