import 'package:flutter/material.dart';

import '../../config/themes.dart';
import '../../models/product_model.dart';

class ProductItem extends StatefulWidget {
  final Product product;
  final Function onTap;

  const ProductItem({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _colorAnimation = ColorTween(
      begin: Themes.red,
      end: Themes.green,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.stop();
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (BuildContext _, Widget? __) {
        return Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            color: _colorAnimation.value,
            borderRadius: Themes.borderRadius,
          ),
          child: Material(
            color: _colorAnimation.value,
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
                      'assets/products/${widget.product.image}.png',
                      color: Colors.white,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                      color: Themes.white,
                    ),
                  ),
                ],
              ),
              onTap: () {
                if (_animationController.status == AnimationStatus.dismissed) {
                  _animationController.forward();
                } else if (_animationController.status ==
                    AnimationStatus.completed) {
                  _animationController.reverse();
                }
                widget.onTap();
              },
            ),
          ),
        );
      },
    );
  }
}
