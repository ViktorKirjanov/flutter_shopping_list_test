import 'package:flutter/material.dart';

import '../../../config/themes.dart';

class BackgroundItem extends StatelessWidget {
  final String bacground;
  final bool isSelected;
  final Function onTap;

  const BackgroundItem({
    super.key,
    required this.bacground,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
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
                splashColor: Themes.white.withOpacity(0.2),
                onTap: () => onTap(),
              ),
            ),
          ),
          if (isSelected)
            Container(
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                color: Colors.black38,
                border: Border.all(
                  width: 3.0,
                  strokeAlign: StrokeAlign.inside,
                  color: Themes.red,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              child: Center(
                child: ClipOval(
                  child: Container(
                    color: Themes.red,
                    padding: const EdgeInsets.all(4.0),
                    child: const Icon(
                      Icons.check_circle_outline_rounded,
                      size: 36.0,
                      color: Themes.white,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
