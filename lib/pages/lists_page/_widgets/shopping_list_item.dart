import 'package:flutter/material.dart';
import 'package:flutter_shopping_list_test/pages/product_list_page/products_page.dart';

import '../../../config/themes.dart';

class ShoppingListItem extends StatelessWidget {
  final String title;
  final int count;
  final String background;

  const ShoppingListItem({
    super.key,
    required this.title,
    required this.count,
    required this.background,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        child: SizedBox(
          height: 125,
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                bottom: 0.0,
                child: GridTile(
                  footer: GridTileBar(
                    title: Text(
                      title,
                      style: const TextStyle(
                        color: Themes.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    backgroundColor: Colors.black38,
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                    ),
                  ),
                  child: Image.asset(
                    background,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    color: Themes.red,
                  ),
                  child: Text(
                    'Items: $count',
                    style: const TextStyle(
                      color: Themes.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Themes.white.withOpacity(0.2),
                    onTap: () =>
                        Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute<bool>(
                        builder: (BuildContext context) =>
                            const ProductListPage(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
