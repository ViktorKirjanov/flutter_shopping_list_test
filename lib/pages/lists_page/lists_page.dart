import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../blocs/lists/lists_bloc.dart';
import '../_widgets/loader.dart';
import '../new_list_page/new_list_page.dart';
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
                      onTap: () =>
                          Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute<bool>(
                          builder: (BuildContext context) =>
                              const NewListPage(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              onRefresh: () async => BlocProvider.of<ListsBloc>(context)
                  .add(const GetListsEvent()),
            );
          } else {
            return Center(
              child: Text(
                state.error ?? 'Oops!',
                style: Theme.of(context).textTheme.caption,
              ),
            );
          }
        },
      ),
    );
  }
}
