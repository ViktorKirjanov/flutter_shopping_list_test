import 'package:flutter_shopping_list_test/models/product_group_model.dart';

abstract class ProductsRepository {
  Future<List<ProductGroup>> getProducts();
}
