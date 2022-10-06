import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_list_test/blocs/lists/lists_bloc.dart';
import 'package:flutter_shopping_list_test/blocs/products/products_bloc.dart';
import 'package:flutter_shopping_list_test/blocs/products/products_state.dart';
import 'package:flutter_shopping_list_test/config/custom_theme.dart';
import 'package:flutter_shopping_list_test/data/firebase_products_repository.dart';
import 'package:flutter_shopping_list_test/models/shopping_list_model.dart';
import 'package:flutter_shopping_list_test/pages/_widgets/lists_error.dart';
import 'package:flutter_shopping_list_test/pages/_widgets/loader.dart';
import 'package:flutter_shopping_list_test/pages/_widgets/product_item/product_item.dart';
import 'package:flutter_shopping_list_test/pages/product_list_page/_widgets/list_button.dart';
import 'package:formz/formz.dart';

class ProductListPage extends StatefulWidget {
  final ShoppingList list;

  const ProductListPage({super.key, required this.list});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  late ProductsBloc _productsBloc;

  @override
  void initState() {
    super.initState();
    _productsBloc = ProductsBloc(FirebaseProductsRepository())
      ..add(const GetProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.list.title),
        actions: [
          CupertinoButton(
            child: const Icon(
              CupertinoIcons.delete_simple,
              color: CustomTheme.darkGray,
            ),
            onPressed: () => context
                .read<ListsBloc>()
                .add(ClearProductListEvent(widget.list.id)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: CustomTheme.contentPadding,
        child: SafeArea(
          child: Column(
            children: [
              _buildSelectedProducts(),
              const SizedBox(height: CustomTheme.mainPadding),
              _buildGroups(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedProducts() {
    return BlocBuilder<ListsBloc, ListsState>(
      builder: (context, state) {
        if (state.status == FormzStatus.submissionInProgress) {
          return const SizedBox(
            height: CustomTheme.productItemHeight,
            child: Center(child: Loader()),
          );
        } else if (state.status == FormzStatus.submissionSuccess) {
          final list =
              state.lists.firstWhere((list) => list.id == widget.list.id);
          if (list.products.isNotEmpty) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: MediaQuery.of(context).size.width /
                    CustomTheme.productItemsInRow,
                mainAxisExtent: CustomTheme.productItemHeight,
                crossAxisSpacing: CustomTheme.gridSpacing,
                mainAxisSpacing: CustomTheme.gridSpacing,
              ),
              itemCount: list.products.length,
              itemBuilder: (BuildContext ctx, index) {
                return ProductItem(
                  product: list.products[index],
                  isSelected: list.products[index].isSelected,
                  onTap: () {
                    BlocProvider.of<ListsBloc>(context)
                        .add(UpdateProductListEvent(
                      widget.list.id,
                      list.products[index],
                    ));
                  },
                );
              },
            );
          } else {
            return const SizedBox(
              height: CustomTheme.productItemHeight,
              child: Center(child: Text('Shopping basket is empty')),
            );
          }
        } else if (state.status == FormzStatus.submissionFailure) {
          return SizedBox(
            height: CustomTheme.productItemHeight,
            child: ListsError(error: state.error),
          );
        }
        return const SizedBox();
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
            return ListButton(
              listId: widget.list.id,
              productGroup: productGroup,
            );
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
