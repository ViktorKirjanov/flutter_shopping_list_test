import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_shopping_list_test/models/product_group_model.dart';

import 'products_repository_interface.dart';

class ProductsRepository implements ProductsRepositoryInterface {
  final _foodCollection = FirebaseFirestore.instance.collection('products');

  @override
  Future<List<ProductGroup>> getProducts() async {
    return await _foodCollection.doc('data').get().then((snapshot) {
      Map<String, dynamic> data = snapshot.data()!;

      List<ProductGroup> group = [];
      data.forEach((_, value) {
        group.add(ProductGroup.fromJson(value));
      });

      return group;
    }).catchError((error) => throw Exception(error));
  }
}
