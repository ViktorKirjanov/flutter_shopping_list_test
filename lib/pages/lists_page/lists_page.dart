import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_list_test/blocs/lists/lists_bloc.dart';
import 'package:flutter_shopping_list_test/pages/_widgets/lists_error.dart';
import 'package:flutter_shopping_list_test/pages/_widgets/loader.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

import '_widgets/widgets.dart';

class ListsPage extends StatelessWidget {
  const ListsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shopping lists")),
      body: BlocBuilder<ListsBloc, ListsState>(
        builder: (context, state) {
          if (state.status == FormzStatus.submissionInProgress) {
            return const Center(child: Loader());
          } else if (state.status == FormzStatus.submissionSuccess) {
            return RefreshIndicator(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  ...state.lists.map(
                    (list) => ShoppingListItem(list: list),
                  ),
                  SafeArea(
                    child: AddButton(
                      onTap: () => context.go('/newListPage'),
                    ),
                  ),
                ],
              ),
              onRefresh: () async => BlocProvider.of<ListsBloc>(context)
                  .add(const GetListsEvent()),
            );
          } else if (state.status == FormzStatus.submissionFailure) {
            return ListsError(error: state.error);
          }
          return const SizedBox();
        },
      ),
    );
  }
}
