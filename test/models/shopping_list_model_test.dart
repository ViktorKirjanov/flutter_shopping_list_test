import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_shopping_list_test/models/product_model.dart';
import 'package:flutter_shopping_list_test/models/shopping_list_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ShoppingList', () {
    test('supports value comparison', () {
      expect(
        const ShoppingList(
          id: 'shoppingListId',
          title: 'title',
          background: 1,
          products: [],
        ),
        const ShoppingList(
          id: 'shoppingListId',
          title: 'title',
          background: 1,
          products: [],
        ),
      );
    });

    test('parse from snapshot', () async {
      final FakeFirebaseFirestore fakeFirebaseFirestore =
          FakeFirebaseFirestore();

      final Map<String, dynamic> data = {
        'title': 'title',
        'background': 1,
        'products': <Product>[],
      };

      await fakeFirebaseFirestore
          .collection('collectionPath')
          .doc('documentPath')
          .set(data);

      final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await fakeFirebaseFirestore
              .collection('collectionPath')
              .doc('documentPath')
              .get();

      expect(
        ShoppingList.fromSnapshot(documentSnapshot),
        const ShoppingList(
          id: 'shoppingListId',
          title: 'title',
          background: 1,
          products: [],
        ),
      );
    });

    test('convert to json', () async {
      expect(
        const ShoppingList(
          id: 'shoppingListId',
          title: 'title',
          background: 1,
          products: [],
        ).toJson(),
        {
          'title': 'title',
          'background': 1,
          'products': <Product>[],
        },
      );
    });
  });
}
