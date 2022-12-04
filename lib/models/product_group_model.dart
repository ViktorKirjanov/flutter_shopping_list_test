import 'package:equatable/equatable.dart';
import 'package:flutter_shopping_list_test/enums/product_category_enum.dart';
import 'package:flutter_shopping_list_test/helpers/enum_helper.dart';
import 'package:flutter_shopping_list_test/models/product_model.dart';

class ProductGroup extends Equatable {
  const ProductGroup({
    required this.group,
    required this.order,
    required this.products,
  });

  factory ProductGroup.fromJson(Map<String, dynamic> jsonData) => ProductGroup(
        group: EnumHelper.enumFromString(
          ProductCategory.values,
          jsonData['group'] as String,
        )!,
        order: jsonData['order'] as int,
        products: (jsonData['products'] as List<dynamic>)
            .map<Product>(
              (item) => Product.fromJson(item as Map<String, dynamic>),
            )
            .toList(),
      );

  final ProductCategory group;
  final int order;
  final List<Product> products;

  @override
  List<Object?> get props => [
        group,
        order,
        products,
      ];
}
