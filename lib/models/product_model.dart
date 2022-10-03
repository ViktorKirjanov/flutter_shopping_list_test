import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String image;
  final bool isSelected;

  const Product({
    required this.name,
    required this.image,
    required this.isSelected,
  });

  factory Product.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return Product(
      name: snapshot.data()!['name'],
      image: snapshot.data()!['image'],
      isSelected: snapshot.data()!['isSelected'],
    );
  }

  factory Product.fromJson(Map<String, dynamic> data) {
    return Product(
      name: data['name'],
      image: data['image'],
      isSelected: data['isSelected'] ?? false,
    );
  }

  Map<String, Object> toJson() {
    return {
      'name': name,
      'image': image,
      'isSelected': isSelected,
    };
  }

  Product copyWith({
    String? name,
    String? image,
    bool? isSelected,
  }) {
    return Product(
      name: name ?? this.name,
      image: image ?? this.image,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [
        name,
        image,
        isSelected,
      ];
}
