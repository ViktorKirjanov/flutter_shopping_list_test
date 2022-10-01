import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_list_test/data/shopping_repository.dart';
import 'package:formz/formz.dart';

import '../../blocs/lists/lists_bloc.dart';
import '../_widgets/loader.dart';
import '../new_list_page/new_list_page.dart';
import '_widgets/widgets.dart';

class ListsPage extends StatefulWidget {
  const ListsPage({super.key});

  @override
  State<ListsPage> createState() => _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {
  late ListsBloc _listsBloc;

  @override
  void initState() {
    super.initState();
    _listsBloc = ListsBloc(ShoppingRepository());
    _getData();
  }

  void _getData() => _listsBloc.add(const GetListsEvent());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shopping lists")),
      body: BlocBuilder<ListsBloc, ListsState>(
        bloc: _listsBloc,
        builder: (context, state) {
          if (state.status == FormzStatus.submissionInProgress) {
            return const Center(child: Loader());
          } else if (state.status == FormzStatus.submissionSuccess) {
            return RefreshIndicator(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  ...state.lists.map(
                    (list) => ShoppingListItem(
                      title: list.title,
                      count: list.products.length,
                      background: 'assets/images/group_${list.background}.jpg',
                    ),
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
              onRefresh: () async => _getData(),
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
