import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_shopping_list_test/models/product_model.dart';

import '../models/shopping_list_model.dart';
import 'shopping_repository.dart';

class FirebaseShoppingRepository implements ShoppingRepository {
  final _shoppingLists = FirebaseFirestore.instance.collection('lists');

  @override
  Future<List<ShoppingList>> getLists() async {
    return await _shoppingLists
        .get()
        .then((snapshot) =>
            snapshot.docs.map((doc) => ShoppingList.fromSnapshot(doc)).toList())
        .catchError((error) => throw Exception(error));
  }

  @override
  Stream<List<ShoppingList>> getShoppingListsStream() {
    return _shoppingLists.snapshots().map((snapshot) {
      final items =
          snapshot.docs.map((doc) => ShoppingList.fromSnapshot(doc)).toList();
      return items;
    });
  }

  @override
  Future<void> createList({
    required String title,
    required int background,
  }) async {
    await _shoppingLists.add({
      'title': title,
      'background': background,
      'products': [],
    });
  }

  @override
  Future<void> addToList({
    required String id,
    required Product product,
  }) async {
    await _shoppingLists.doc(id).update({
      "products": FieldValue.arrayUnion([product.toJson()])
    }).catchError((error) => throw Exception(error));
  }

  @override
  Future<void> removeFromList({
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
  Future<void> updateList({
    required String id,
    required List<Product> products,
  }) async {
    await _shoppingLists.doc(id).update({
      'products': products.map((p) => p.toJson()).toList()
    }).catchError((error) => throw Exception(error));
  }
}
