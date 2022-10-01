import '../models/shopping_list_model.dart';

abstract class ShoppingRepositoryInterface {
  Future<List<ShoppingList>> getShoppingLists();

  Stream<List<ShoppingList>> getShoppingListsStream();

  Future<void> addShoppingList({required ShoppingList shoppingList});
}
