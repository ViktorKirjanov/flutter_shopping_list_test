import 'package:flutter/material.dart';

import '../../../config/themes.dart';
import '../../products_page/products_page.dart';

class ListButton extends StatelessWidget {
  final String title;

  const ListButton({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 2.0),
      height: 50.0,
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Themes.white,
          textStyle: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
          backgroundColor: Themes.grey,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            const Icon(
              Icons.keyboard_arrow_right_rounded,
            ),
          ],
        ),
        onPressed: () => Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductsPage(title: title),
          ),
        ),
      ),
    );
  }
}
