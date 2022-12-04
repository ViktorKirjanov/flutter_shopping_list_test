import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_shopping_list_test/data/products_repository.dart';
import 'package:flutter_shopping_list_test/models/product_group_model.dart';

class FirebaseProductsRepository implements ProductsRepository {
  final _foodCollection = FirebaseFirestore.instance.collection('products');

  @override
  Future<List<ProductGroup>> getProducts() async =>
      _foodCollection.doc('data').get().then((snapshot) {
        final Map<String, dynamic> data = snapshot.data()!;

        final List<ProductGroup> group = [];
        data.forEach((_, value) {
          group.add(ProductGroup.fromJson(value as Map<String, dynamic>));
        });

        return group;
      }).catchError((Object error) => throw Exception(error));
}
