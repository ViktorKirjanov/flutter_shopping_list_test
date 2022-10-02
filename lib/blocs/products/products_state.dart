import 'package:equatable/equatable.dart';
import 'package:flutter_shopping_list_test/models/product_group_model.dart';

enum ProductsStatus { initial, loading, success, failure }

class ProductsState extends Equatable {
  final ProductsStatus status;
  final List<ProductGroup> groups;
  final String? error;

  const ProductsState({
    this.status = ProductsStatus.initial,
    this.groups = const [],
    this.error,
  });

  ProductsState copyWith({
    ProductsStatus? status,
    List<ProductGroup>? groups,
    String? error,
  }) {
    return ProductsState(
      status: status ?? this.status,
      groups: groups ?? this.groups,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, groups, error];
}
