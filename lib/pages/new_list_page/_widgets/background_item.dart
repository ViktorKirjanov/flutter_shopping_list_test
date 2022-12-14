import 'package:flutter/material.dart';

import 'package:flutter_shopping_list_test/config/custom_theme.dart';

class BackgroundItem extends StatelessWidget {
  const BackgroundItem({
    super.key,
    required this.bacground,
    required this.isSelected,
    required this.onTap,
  });

  final String bacground;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: CustomTheme.smallRadius,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.asset(
                bacground,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: CustomTheme.white.withOpacity(0.2),
                  onTap: onTap,
                ),
              ),
            ),
            if (isSelected)
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.black38,
                  border: Border.all(
                    width: 3.0,
                    strokeAlign: StrokeAlign.inside,
                    color: CustomTheme.red,
                  ),
                  borderRadius: CustomTheme.smallRadius,
                ),
                child: Center(
                  child: ClipOval(
                    child: Container(
                      color: CustomTheme.red,
                      padding: const EdgeInsets.all(4.0),
                      child: const Icon(
                        Icons.check_circle_outline_rounded,
                        size: 36.0,
                        color: CustomTheme.white,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      );
}
