import 'package:flutter_shopping_list_test/enums/product_category_enum.dart';
import 'package:flutter_shopping_list_test/models/product_group_model.dart';
import 'package:flutter_shopping_list_test/models/product_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProductGroup', () {
    test('supports value comparison', () {
      expect(
        const ProductGroup(
          group: ProductCategory.fruits,
          order: 1,
          products: [
            Product(
              name: 'Bananas',
              image: 'bananas',
            ),
          ],
        ),
        const ProductGroup(
          group: ProductCategory.fruits,
          order: 1,
          products: [
            Product(
              name: 'Bananas',
              image: 'bananas',
            ),
          ],
        ),
      );
    });

    test('parse from json', () async {
      expect(
        ProductGroup.fromJson(const {
          'group': 'fruits',
          'order': 1,
          'products': [
            {
              'name': 'Bananas',
              'image': 'bananas',
            }
          ]
        }),
        const ProductGroup(
          group: ProductCategory.fruits,
          order: 1,
          products: [
            Product(
              name: 'Bananas',
              image: 'bananas',
            ),
          ],
        ),
      );
    });
  });
}
