import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_shopping_list_test/models/product_model.dart';

import '../models/shopping_list_model.dart';
import 'shopping_repository_interface.dart';

class ShoppingRepository implements ShoppingRepositoryInterface {
  final _shoppingLists = FirebaseFirestore.instance.collection('lists');

  @override
  Future<List<ShoppingList>> getShoppingLists() async {
    return await _shoppingLists
        .get()
        .then((snapshot) =>
            snapshot.docs.map((doc) => ShoppingList.fromSnapshot(doc)).toList())
        .catchError((error) => throw Exception(error));
  }

  @override
  Stream<List<ShoppingList>> getShoppingListsStream() {
    return _shoppingLists.snapshots().map((snapshot) {
      var items =
          snapshot.docs.map((doc) => ShoppingList.fromSnapshot(doc)).toList();
      return items;
    });
  }

  @override
  Future<void> addShoppingList({required ShoppingList shoppingList}) async {
    await _shoppingLists.add(shoppingList.toJson());
  }

  @override
  Future<void> addToShoppingList({
    required String id,
    required Product product,
  }) async {
    await _shoppingLists.doc(id).update({
      "products": FieldValue.arrayUnion([product.toJson()])
    }).catchError((error) => throw Exception(error));
  }

  @override
  Future<void> removeFromShoppingList({
    required String id,
    required Product product,
  }) async {
    await _shoppingLists.doc(id).update({
      'products': FieldValue.arrayRemove([product.toJson()])
    }).catchError((error) => throw Exception(error));
  }

  @override
  Future<void> clearShoppingList({required String id}) async {
    await _shoppingLists
        .doc(id)
        .update({'products': []}).catchError((error) => throw Exception(error));
  }

  @override
  Future<void> updateShoppingList({
    required String id,
    required List<Product> products,
  }) async {
    await _shoppingLists.doc(id).update({
      'products': products.map((p) => p.toJson()).toList()
    }).catchError((error) => throw Exception(error));
  }
}
