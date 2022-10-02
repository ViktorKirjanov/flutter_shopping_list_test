import 'package:flutter_shopping_list_test/models/product_model.dart';

import '../models/shopping_list_model.dart';

abstract class ShoppingRepositoryInterface {
  Future<List<ShoppingList>> getShoppingLists();

  Stream<List<ShoppingList>> getShoppingListsStream();

  Future<void> addShoppingList({required ShoppingList shoppingList});

  Future<void> addToShoppingList({
    required String id,
    required Product product,
  });

  Future<void> removeFromShoppingList({
    required String id,
    required Product product,
  });
}
