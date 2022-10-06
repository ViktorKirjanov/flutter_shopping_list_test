import 'package:flutter_shopping_list_test/models/product_model.dart';

import '../models/shopping_list_model.dart';

abstract class ShoppingRepository {
  Future<List<ShoppingList>> getLists();

  Stream<List<ShoppingList>> getShoppingListsStream();

  Future<void> createList({
    required String title,
    required int background,
  });

  Future<void> addToList({
    required String id,
    required Product product,
  });

  Future<void> clearShoppingList({required String id});

  Future<void> removeFromList({
    required String id,
    required Product product,
  });

  Future<void> updateList({
    required String id,
    required List<Product> products,
  });
}
