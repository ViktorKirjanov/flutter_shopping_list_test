import 'package:flutter/material.dart';
import 'package:flutter_shopping_list_test/models/shopping_list_model.dart';
import 'package:flutter_shopping_list_test/pages/lists_page/lists_page.dart';
import 'package:flutter_shopping_list_test/pages/new_list_page/new_list_page.dart';
import 'package:flutter_shopping_list_test/pages/product_list_page/products_list_page.dart';
import 'package:flutter_shopping_list_test/pages/products_page/products_page.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const ListsPage(),
      routes: <GoRoute>[
        GoRoute(
          path: 'newListPage',
          builder: (BuildContext context, GoRouterState state) =>
              const NewListPage(),
        ),
        GoRoute(
          path: 'productListPage',
          builder: (context, state) =>
              ProductListPage(list: state.extra as ShoppingList),
        ),
        GoRoute(
          path: 'productsPage',
          builder: (context, state) => ProductsPage(
            listId: (state.extra as ProductsPageArguments).listId,
            productGroup: (state.extra as ProductsPageArguments).productGroup,
          ),
        ),
      ],
    ),
  ],
);
