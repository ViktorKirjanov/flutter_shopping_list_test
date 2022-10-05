import 'package:flutter/material.dart';
import 'package:flutter_shopping_list_test/config/themes.dart';
import 'package:flutter_shopping_list_test/models/shopping_list_model.dart';
import 'package:go_router/go_router.dart';

class ShoppingListItem extends StatelessWidget {
  final ShoppingList list;

  const ShoppingListItem({
    super.key,
    required this.list,
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
                      list.title,
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
                    'assets/images/group_${list.background}.jpg',
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
                    'Items: ${list.products.length}',
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
                    onTap: () => context.go('/productListPage', extra: list),
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
