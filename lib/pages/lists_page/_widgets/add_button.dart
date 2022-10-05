import 'package:flutter/material.dart';

import '../../../config/custom_theme.dart';

class AddButton extends StatelessWidget {
  final Function onTap;

  const AddButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          foregroundColor: CustomTheme.white,
          backgroundColor: CustomTheme.darkestGrey,
          shape: const RoundedRectangleBorder(
            borderRadius: CustomTheme.smallRadius,
          ),
          fixedSize: const Size(double.infinity, 50.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.add_rounded,
            size: 28.0,
          ),
          SizedBox(width: 8.0),
          Text(
            'Add new list',
            style: CustomTheme.buttonText,
          )
        ],
      ),
      onPressed: () => onTap(),
    );
  }
}
