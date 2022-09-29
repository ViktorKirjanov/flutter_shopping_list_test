import 'package:flutter/material.dart';

import '../../../config/themes.dart';

class AddButton extends StatelessWidget {
  final Function onTap;

  const AddButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          foregroundColor: Themes.white,
          backgroundColor: Themes.darkestGrey,
          shape: const RoundedRectangleBorder(
            borderRadius: Themes.borderRadius,
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
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16.0,
            ),
          )
        ],
      ),
      onPressed: () => onTap(),
    );
  }
}
