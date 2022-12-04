import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_list_test/blocs/lists/lists_bloc.dart';
import 'package:flutter_shopping_list_test/config/custom_theme.dart';
import 'package:flutter_shopping_list_test/helpers/enum_helper.dart';
import 'package:flutter_shopping_list_test/helpers/string_helper.dart';
import 'package:flutter_shopping_list_test/models/product_group_model.dart';
import 'package:flutter_shopping_list_test/pages/_widgets/product_item/product_item.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

class ProductsPageArguments {
  ProductsPageArguments(this.listId, this.productGroup);

  final String listId;
  final ProductGroup productGroup;
}

class ProductsPage extends StatelessWidget {
  const ProductsPage({
    super.key,
    required this.listId,
    required this.productGroup,
  });
  final String listId;
  final ProductGroup productGroup;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            EnumHelper.enumToString(productGroup.group).toCapitalized(),
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: CustomTheme.contentPadding,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: MediaQuery.of(context).size.width /
                    CustomTheme.productItemsInRow,
                mainAxisExtent: CustomTheme.productItemHeight,
                crossAxisSpacing: CustomTheme.gridSpacing,
                mainAxisSpacing: CustomTheme.gridSpacing,
              ),
              itemCount: productGroup.products.length,
              itemBuilder: (BuildContext ctx, index) =>
                  BlocConsumer<ListsBloc, ListsState>(
                listener: (context, state) {
                  if (state.status == FormzStatus.submissionFailure) {
                    context.go('/');
                  }
                },
                buildWhen: (previous, current) {
                  if (current.status == FormzStatus.submissionSuccess) {
                    final indexProduct = productGroup.products[index];
                    final previousList =
                        previous.lists.firstWhere((list) => list.id == listId);
                    final currentList =
                        current.lists.firstWhere((list) => list.id == listId);

                    final inPreviousList =
                        previousList.products.firstWhereOrNull(
                              (p) => p.name == indexProduct.name,
                            ) !=
                            null;
                    final inCurrentList = currentList.products.firstWhereOrNull(
                          (p) => p.name == indexProduct.name,
                        ) !=
                        null;

                    return inPreviousList != inCurrentList;
                  }
                  return false;
                },
                builder: (context, state) {
                  final list =
                      state.lists.firstWhere((list) => list.id == listId);

                  final product = list.products.firstWhereOrNull(
                    (p) => p.name == productGroup.products[index].name,
                  );

                  return ProductItem(
                    product: productGroup.products[index],
                    isSelected: product != null,
                    isCompleted: product != null ? product.isSelected : false,
                    onTap: () {
                      if (product == null) {
                        context.read<ListsBloc>().add(
                              AddToListEvent(
                                listId,
                                productGroup.products[index],
                              ),
                            );
                      } else {
                        context.read<ListsBloc>().add(
                              RemoveFromListEvent(
                                listId,
                                productGroup.products[index],
                              ),
                            );
                      }
                    },
                  );
                },
              ),
            ),
          ),
        ),
      );
}
