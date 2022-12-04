import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_list_test/blocs/lists/lists_bloc.dart';
import 'package:flutter_shopping_list_test/config/custom_theme.dart';
import 'package:flutter_shopping_list_test/pages/_widgets/lists_error.dart';
import 'package:flutter_shopping_list_test/pages/_widgets/loader.dart';
import 'package:flutter_shopping_list_test/pages/lists_page/_widgets/add_button.dart';
import 'package:flutter_shopping_list_test/pages/lists_page/_widgets/shopping_list_item.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

class ListsPage extends StatelessWidget {
  const ListsPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Shopping lists')),
        body: BlocBuilder<ListsBloc, ListsState>(
          builder: (context, state) {
            if (state.status == FormzStatus.submissionInProgress) {
              return const Center(child: Loader());
            } else if (state.status == FormzStatus.submissionSuccess) {
              return RefreshIndicator(
                child: ListView(
                  padding: CustomTheme.contentPadding,
                  children: [
                    ...state.lists.map(
                      (list) => ShoppingListItem(list: list),
                    ),
                    SafeArea(
                      child: AddButton(
                        onTap: () => context.push('/newListPage'),
                      ),
                    ),
                  ],
                ),
                onRefresh: () async =>
                    context.read<ListsBloc>().add(const GetListsEvent()),
              );
            } else if (state.status == FormzStatus.submissionFailure) {
              return ListsError(error: state.error);
            }
            return const SizedBox();
          },
        ),
      );
}
