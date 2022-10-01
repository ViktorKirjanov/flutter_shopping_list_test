import 'package:cloud_firestore/cloud_firestore.dart';

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
}
