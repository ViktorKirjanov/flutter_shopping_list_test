import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_shopping_list_test/models/product_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Product', () {
    test('supports value comparison', () {
      expect(
        const Product(
          name: 'Bananas',
          image: 'bananas',
        ),
        const Product(
          name: 'Bananas',
          image: 'bananas',
        ),
      );
    });

    test('parse from snapshot', () async {
      final FakeFirebaseFirestore fakeFirebaseFirestore =
          FakeFirebaseFirestore();

      Map<String, dynamic> data = {
        'name': 'Bananas',
        'image': 'bananas',
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
        Product.fromSnapshot(documentSnapshot),
        const Product(
          name: 'Bananas',
          image: 'bananas',
        ),
      );
    });

    test('parse from json', () async {
      expect(
        Product.fromJson(const {
          'name': 'Bananas',
          'image': 'bananas',
        }),
        const Product(
          name: 'Bananas',
          image: 'bananas',
        ),
      );
    });

    test('convert to json', () async {
      expect(
        const Product(
          name: 'Bananas',
          image: 'bananas',
        ).toJson(),
        {
          'name': 'Bananas',
          'image': 'bananas',
        },
      );
    });
  });
}
