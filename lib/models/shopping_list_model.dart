import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_shopping_list_test/models/product_model.dart';

class ShoppingList extends Equatable {
  final String? id;
  final String title;
  final int background;
  final List<Product> products;

  const ShoppingList({
    this.id,
    required this.title,
    required this.background,
    required this.products,
  });

  factory ShoppingList.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return ShoppingList(
      id: snapshot.id,
      title: snapshot.data()!['title'],
      background: snapshot.data()!['background'],
      products: snapshot.data()!['products'].map<Product>((item) {
        return Product.fromJson(item);
      }).toList(),
    );
  }

  Map<String, Object> toJson() {
    return {
      'title': title,
      'background': background,
      'products': [],
    };
  }

  @override
  List<Object?> get props => [title, background, products];
}
