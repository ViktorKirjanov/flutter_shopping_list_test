import 'package:flutter/material.dart';

import 'package:flutter_shopping_list_test/config/custom_theme.dart';

class IsCompleted extends StatelessWidget {
  const IsCompleted({super.key});

  @override
  Widget build(BuildContext context) => Positioned(
        left: 5.0,
        top: 5.0,
        child: Container(
          width: 10.0,
          height: 10.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: CustomTheme.yellow,
          ),
        ),
      );
}
