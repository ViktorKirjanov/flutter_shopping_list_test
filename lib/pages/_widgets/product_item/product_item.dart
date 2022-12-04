import 'package:flutter/material.dart';

import 'package:flutter_shopping_list_test/config/custom_theme.dart';
import 'package:flutter_shopping_list_test/models/product_model.dart';
import 'package:flutter_shopping_list_test/pages/_widgets/product_item/is_completed.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
    this.isSelected = false,
    this.isCompleted = false,
    required this.onTap,
  });

  final Product product;
  final bool isSelected;
  final bool isCompleted;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) => Material(
        color: isSelected ? CustomTheme.green : CustomTheme.red,
        borderRadius: CustomTheme.smallRadius,
        child: InkWell(
          borderRadius: CustomTheme.smallRadius,
          splashColor: CustomTheme.white.withOpacity(0.4),
          onTap: onTap,
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
        ),
      );
}
