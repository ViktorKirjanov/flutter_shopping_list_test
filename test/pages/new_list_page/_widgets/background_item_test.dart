// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_shopping_list_test/pages/new_list_page/_widgets/background_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('test BackgroundItem', () {
    testWidgets(
      'isSelected',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BackgroundItem(
                bacground: 'assets/images/group_0.jpg',
                isSelected: true,
                onTap: () {},
              ),
            ),
          ),
        );

        expect(find.byType(BackgroundItem), findsOneWidget);
        expect(find.image(const AssetImage('assets/images/group_0.jpg')),
            findsOneWidget);
        expect(find.byIcon(Icons.check_circle_outline_rounded), findsOneWidget);
      },
    );

    testWidgets(
      '!isSelected',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BackgroundItem(
                key: const Key('backgroundItem'),
                bacground: 'assets/images/group_1.jpg',
                isSelected: false,
                onTap: () => print('on tap'),
              ),
            ),
          ),
        );

        expect(find.byType(BackgroundItem), findsOneWidget);
        expect(find.image(const AssetImage('assets/images/group_1.jpg')),
            findsOneWidget);
        expect(find.byIcon(Icons.check_circle_outline_rounded), findsNothing);
        expectLater(
          () => tester.tap(find.byKey(const Key('backgroundItem'))),
          prints('on tap\n'),
        );
      },
    );
  });
}
