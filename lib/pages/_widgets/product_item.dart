import 'package:flutter/material.dart';

import '../../config/themes.dart';
import '../../models/product_model.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final bool isSelected;
  final bool isCompleted;
  final Function onTap;

  const ProductItem({
    super.key,
    required this.product,
    this.isSelected = false,
    this.isCompleted = false,
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
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 60,
                      child: Image.asset(
                        'assets/products/${product.image}.png',
                        color: Themes.white,
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
              ),
              if (isCompleted)
                Positioned(
                  left: 5.0,
                  top: 5.0,
                  child: Container(
                    width: 10.0,
                    height: 10.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Themes.yellow,
                    ),
                  ),
                ),
            ],
          ),
          onTap: () => onTap(),
        ),
      ),
    );
  }
}
