import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_shopping_list_test/models/product_model.dart';

class ShoppingList extends Equatable {
  const ShoppingList({
    required this.id,
    required this.title,
    required this.background,
    required this.products,
  });

  factory ShoppingList.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) =>
      ShoppingList(
        id: snapshot.id,
        title: snapshot.data()!['title'] as String,
        background: snapshot.data()!['background'] as int,
        products: (snapshot.data()!['products'] as List<dynamic>)
            .map<Product>(
              (item) => Product.fromJson(item as Map<String, dynamic>),
            )
            .toList(),
      );

  final String id;
  final String title;
  final int background;
  final List<Product> products;

  Map<String, Object> toJson() => {
        'title': title,
        'background': background,
        'products': <Product>[],
      };

  @override
  List<Object?> get props => [title, background, products];
}
