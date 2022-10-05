import 'package:flutter/material.dart';

import '../../../config/custom_theme.dart';
import '../../../models/product_model.dart';
import 'is_completed.dart';

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
    return Material(
      color: isSelected ? CustomTheme.green : CustomTheme.red,
      borderRadius: CustomTheme.smallRadius,
      child: InkWell(
        borderRadius: CustomTheme.smallRadius,
        splashColor: CustomTheme.white.withOpacity(0.4),
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
                      color: CustomTheme.white,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    product.name,
                    style: CustomTheme.text,
                  ),
                ],
              ),
            ),
            if (isCompleted) const IsCompleted(),
          ],
        ),
        onTap: () => onTap(),
      ),
    );
  }
}
