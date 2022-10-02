import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String image;

  const Product({
    required this.name,
    required this.image,
  });

  factory Product.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return Product(
      name: snapshot.data()!['name'],
      image: snapshot.data()!['image'],
    );
  }

  factory Product.fromJson(Map<String, dynamic> data) {
    return Product(
      name: data['name'],
      image: data['image'],
    );
  }

  Map<String, Object> toJson() {
    return {
      'name': name,
      'image': image,
    };
  }

  @override
  List<Object?> get props => [
        name,
        image,
      ];
}
