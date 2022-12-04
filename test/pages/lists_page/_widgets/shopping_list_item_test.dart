// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_shopping_list_test/models/product_model.dart';
import 'package:flutter_shopping_list_test/models/shopping_list_model.dart';
import 'package:flutter_shopping_list_test/pages/lists_page/_widgets/shopping_list_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('test ShoppingListItem', () {
    testWidgets(
      'with selected products',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: ShoppingListItem(
                list: ShoppingList(
                  id: 'shoppingListId',
                  title: 'Party',
                  background: 0,
                  products: [
                    Product(
                      name: 'Bananas',
                      image: 'bananas',
                      isSelected: false,
                    ),
                    Product(
                      name: 'Apples',
                      image: 'apples',
                      isSelected: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );

        expect(find.byType(ShoppingListItem), findsOneWidget);
        expect(
          find.image(const AssetImage('assets/images/group_0.jpg')),
          findsOneWidget,
        );
        expect(find.text('Party'), findsOneWidget);
        expect(find.text('Items: 2'), findsOneWidget);
        expect(find.byType(GridTile), findsOneWidget);
        expect(find.byIcon(Icons.arrow_forward_ios_rounded), findsOneWidget);
      },
    );
  });
}
