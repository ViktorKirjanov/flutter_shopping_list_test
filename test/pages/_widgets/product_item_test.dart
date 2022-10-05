import 'package:flutter/material.dart';
import 'package:flutter_shopping_list_test/config/custom_theme.dart';
import 'package:flutter_shopping_list_test/models/product_model.dart';
import 'package:flutter_shopping_list_test/pages/_widgets/product_item/is_completed.dart';
import 'package:flutter_shopping_list_test/pages/_widgets/product_item/product_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('test ProductItem', () {
    testWidgets(
      'iselected and isCompleted Bananas',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ProductItem(
                product: const Product(
                  name: 'Bananas',
                  image: 'bananas',
                  isSelected: true,
                ),
                isSelected: true,
                isCompleted: true,
                onTap: () {},
              ),
            ),
          ),
        );

        expect(find.image(const AssetImage('assets/products/bananas.png')),
            findsOneWidget);
        expect(find.text('Bananas'), findsOneWidget);
        expect(
            (tester.firstWidget(find.byType(Material).at(1)) as Material).color,
            CustomTheme.green);
        expect(find.byType(IsCompleted), findsOneWidget);
      },
    );

    testWidgets(
      '!iselected and !isCompleted Bananas',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ProductItem(
                product: const Product(
                  name: 'Bananas',
                  image: 'bananas',
                  isSelected: true,
                ),
                isSelected: false,
                isCompleted: false,
                onTap: () {},
              ),
            ),
          ),
        );

        expect(find.image(const AssetImage('assets/products/bananas.png')),
            findsOneWidget);
        expect(find.text('Bananas'), findsOneWidget);
        expect(
            (tester.firstWidget(find.byType(Material).at(1)) as Material).color,
            CustomTheme.red);
        expect(find.byType(IsCompleted), findsNothing);
      },
    );
  });
}
