import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ShoppingList extends Equatable {
  final String title;
  final int background;
  final List<String> products;

  const ShoppingList({
    required this.title,
    required this.background,
    required this.products,
  });

  // TODO: factory ShoppingList.fromSnapshot
  static ShoppingList fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return ShoppingList(
      title: snapshot.data()!['title'],
      background: snapshot.data()!['background'],
      products: snapshot.data()!['products'] != null ? ['xxxx', 'zzzz'] : [],
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
