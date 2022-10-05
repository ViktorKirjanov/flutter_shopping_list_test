import 'package:flutter/material.dart';
import 'package:flutter_shopping_list_test/config/themes.dart';
import 'package:flutter_shopping_list_test/helpers/enum_helper.dart';
import 'package:flutter_shopping_list_test/helpers/string_helper.dart';
import 'package:flutter_shopping_list_test/models/product_group_model.dart';
import 'package:flutter_shopping_list_test/pages/products_page/products_page.dart';
import 'package:go_router/go_router.dart';

class ListButton extends StatelessWidget {
  final String listId;
  final ProductGroup productGroup;

  const ListButton({
    super.key,
    required this.listId,
    required this.productGroup,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 2.0),
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
            Text(EnumHelper.enumToString(productGroup.group).toCapitalized()),
            const Icon(
              Icons.keyboard_arrow_right_rounded,
            ),
          ],
        ),
        onPressed: () => context.go(
          '/productsPage',
          extra: ProductsPageArguments(listId, productGroup),
        ),
      ),
    );
  }
}
