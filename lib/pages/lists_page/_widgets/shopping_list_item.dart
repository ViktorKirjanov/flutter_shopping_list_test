import 'package:flutter/material.dart';
import 'package:flutter_shopping_list_test/models/shopping_list_model.dart';
import 'package:go_router/go_router.dart';

import '../../../config/custom_theme.dart';

class ShoppingListItem extends StatelessWidget {
  final ShoppingList list;

  const ShoppingListItem({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: CustomTheme.secondaryPadding),
      child: ClipRRect(
        borderRadius: CustomTheme.bigRadius,
        child: SizedBox(
          height: CustomTheme.bigShoppingListHeight,
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                bottom: 0.0,
                child: GridTile(
                  footer: GridTileBar(
                    title: Text(
                      list.title,
                      style: CustomTheme.header1,
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
                  padding: const EdgeInsets.all(CustomTheme.secondaryPadding),
                  decoration: const BoxDecoration(
                    borderRadius: CustomTheme.smallRadius,
                    color: CustomTheme.red,
                  ),
                  child: Text(
                    'Items: ${list.products.length}',
                    style: CustomTheme.header2,
                  ),
                ),
              ),
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: CustomTheme.white.withOpacity(0.2),
                    onTap: () => context.push('/productListPage', extra: list),
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
