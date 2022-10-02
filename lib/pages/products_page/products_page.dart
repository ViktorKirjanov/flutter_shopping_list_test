import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_shopping_list_test/helpers/enum_helper.dart';
import 'package:flutter_shopping_list_test/helpers/string_helper.dart';
import 'package:flutter_shopping_list_test/models/product_group_model.dart';
import 'package:flutter_shopping_list_test/pages/_widgets/product_item.dart';

class ProductsPage extends StatefulWidget {
  final ProductGroup productGroup;

  const ProductsPage({super.key, required this.productGroup});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          EnumHelper.enumToString(widget.productGroup.group).toCapitalized(),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16.0),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width / 3,
              mainAxisExtent: 100,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemCount: widget.productGroup.products.length,
            itemBuilder: (BuildContext ctx, index) {
              return ProductItem(
                product: widget.productGroup.products[index],
                onTap: () => log("remove $index"),
              );
            },
          ),
        ),
      ),
    );
  }
}
