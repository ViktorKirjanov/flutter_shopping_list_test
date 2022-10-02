import 'package:flutter/material.dart';

import '../../config/themes.dart';
import '../../models/product_model.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final bool isSelected;
  final Function onTap;

  const ProductItem({
    super.key,
    required this.product,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isSelected ? Themes.green : Themes.red,
        borderRadius: Themes.borderRadius,
      ),
      child: Material(
        color: isSelected ? Themes.green : Themes.red,
        borderRadius: Themes.borderRadius,
        child: InkWell(
          borderRadius: Themes.borderRadius,
          splashColor: Themes.white.withOpacity(0.4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
                child: Image.asset(
                  'assets/products/${product.image}.png',
                  color: Colors.white,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                product.name,
                style: const TextStyle(
                  color: Themes.white,
                ),
              ),
            ],
          ),
          onTap: () {
            onTap();
          },
        ),
      ),
    );
  }
}
