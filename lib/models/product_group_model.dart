import 'package:equatable/equatable.dart';
import 'package:flutter_shopping_list_test/helpers/enum_helper.dart';

import '../enums/product_category_enum.dart';
import 'product_model.dart';

class ProductGroup extends Equatable {
  final ProductCategory group;
  final int order;
  final List<Product> products;

  const ProductGroup({
    required this.group,
    required this.order,
    required this.products,
  });

  factory ProductGroup.fromJson(Map<String, dynamic> jsonData) {
    return ProductGroup(
      group:
          EnumHelper.enumFromString(ProductCategory.values, jsonData['group'])!,
      order: jsonData['order'],
      products: jsonData['products'].map<Product>((item) {
        return Product.fromJson(item);
      }).toList(),
    );
  }

  @override
  List<Object?> get props => [
        group,
        order,
        products,
      ];
}
