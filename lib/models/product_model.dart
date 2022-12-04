import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  const Product({
    required this.name,
    required this.image,
    required this.isSelected,
  });

  factory Product.fromJson(Map<String, dynamic> data) => Product(
        name: data['name'] as String,
        image: data['image'] as String,
        isSelected: data['isSelected'] as bool? ?? false,
      );

  factory Product.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) =>
      Product(
        name: snapshot.data()!['name'] as String,
        image: snapshot.data()!['image'] as String,
        isSelected: snapshot.data()!['isSelected'] as bool,
      );

  final String name;
  final String image;
  final bool isSelected;

  Map<String, Object> toJson() => {
        'name': name,
        'image': image,
        'isSelected': isSelected,
      };

  Product copyWith({
    String? name,
    String? image,
    bool? isSelected,
  }) =>
      Product(
        name: name ?? this.name,
        image: image ?? this.image,
        isSelected: isSelected ?? this.isSelected,
      );

  @override
  List<Object?> get props => [
        name,
        image,
        isSelected,
      ];
}
