import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_list_test/blocs/lists/lists_bloc.dart';
import 'package:flutter_shopping_list_test/helpers/enum_helper.dart';
import 'package:flutter_shopping_list_test/helpers/string_helper.dart';
import 'package:flutter_shopping_list_test/models/product_group_model.dart';
import 'package:flutter_shopping_list_test/pages/_widgets/product_item.dart';

class ProductsPage extends StatefulWidget {
  final String listId;
  final ProductGroup productGroup;

  const ProductsPage({
    super.key,
    required this.listId,
    required this.productGroup,
  });

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
              return BlocBuilder<ListsBloc, ListsState>(
                buildWhen: (previous, current) {
                  var indexProduct = widget.productGroup.products[index];
                  var previousList = previous.lists
                      .firstWhere((list) => list.id == widget.listId);
                  var currentList = current.lists
                      .firstWhere((list) => list.id == widget.listId);

                  var inPreviousList = previousList.products.firstWhereOrNull(
                          (p) => p.name == indexProduct.name) !=
                      null;
                  var inCurrentList = currentList.products.firstWhereOrNull(
                          (p) => p.name == indexProduct.name) !=
                      null;

                  return inPreviousList != inCurrentList;
                },
                builder: (context, state) {
                  var list = state.lists
                      .firstWhere((list) => list.id == widget.listId);

                  var product = list.products.firstWhereOrNull(
                    (p) => p.name == widget.productGroup.products[index].name,
                  );

                  return ProductItem(
                    product: widget.productGroup.products[index],
                    isSelected: product != null,
                    isCompleted: product != null ? product.isSelected : false,
                    onTap: () {
                      if (product == null) {
                        BlocProvider.of<ListsBloc>(context).add(AddToListEvent(
                          widget.listId,
                          widget.productGroup.products[index],
                        ));
                      } else {
                        BlocProvider.of<ListsBloc>(context)
                            .add(RemoveFromListEvent(
                          widget.listId,
                          widget.productGroup.products[index],
                        ));
                      }
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
