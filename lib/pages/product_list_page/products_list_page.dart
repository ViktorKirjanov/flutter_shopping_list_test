import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_list_test/blocs/products/products_bloc.dart';
import 'package:flutter_shopping_list_test/blocs/products/products_state.dart';
import 'package:flutter_shopping_list_test/models/product_model.dart';

import '../../data/products_repository.dart';
import '../_widgets/loader.dart';
import '_widgets/list_button.dart';
import '../_widgets/product_item.dart';

class ProductListPage extends StatefulWidget {
  final String title;

  const ProductListPage({super.key, required this.title});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  late ProductsBloc _productsBloc;

  @override
  void initState() {
    super.initState();
    _productsBloc = ProductsBloc(ProductsRepository())
      ..add(const GetProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            children: [
              _buildSelectedProducts(),
              const SizedBox(height: 16.0),
              _buildGroups(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedProducts() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: MediaQuery.of(context).size.width / 3,
        mainAxisExtent: 100,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: 7,
      itemBuilder: (BuildContext ctx, index) {
        return ProductItem(
          product: const Product(name: 'xxx', image: 'bananas'),
          onTap: () {
            log("remove $index");
          },
        );
      },
    );
  }

  Widget _buildGroups() {
    return BlocBuilder<ProductsBloc, ProductsState>(
      bloc: _productsBloc,
      builder: (context, state) {
        if (state.status == ProductsStatus.loading) {
          return const Center(child: Loader());
        } else if (state.status == ProductsStatus.success) {
          return Column(
              children: state.groups.map((productGroup) {
            return ListButton(productGroup: productGroup);
          }).toList());
        } else {
          return Center(
            child: Text(
              state.error ?? 'Oops!',
              style: Theme.of(context).textTheme.caption,
            ),
          );
        }
      },
    );
  }
}
