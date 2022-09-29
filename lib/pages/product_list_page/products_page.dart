import 'dart:developer';

import 'package:flutter/material.dart';

import '_widgets/list_button.dart';
import '../_widgets/product_item.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<int> items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16.0),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: MediaQuery.of(context).size.width / 3,
                  mainAxisExtent: 100,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemCount: items.length,
                itemBuilder: (BuildContext ctx, index) {
                  return ProductItem(
                    title: 'Bananas',
                    onTap: () {
                      log("remove $index");
                    },
                  );
                },
              ),
              const ListButton(title: 'Fruits'),
              const ListButton(title: 'Vegetables'),
              const ListButton(title: 'Bread'),
              const ListButton(title: 'Milk'),
              const ListButton(title: 'Meat'),
              const ListButton(title: 'Ingredients'),
            ],
          ),
        ),
      ),
    );
  }
}
