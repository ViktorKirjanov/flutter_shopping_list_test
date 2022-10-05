import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_list_test/blocs/new_list/new_list_bloc.dart';
import 'package:flutter_shopping_list_test/data/shopping_repository.dart';
import 'package:flutter_shopping_list_test/pages/_widgets/loader.dart';
import 'package:flutter_shopping_list_test/utils/shopping_list_name.dart';
import 'package:formz/formz.dart';

import '_widgets/widgets.dart';

class NewListPage extends StatefulWidget {
  const NewListPage({super.key});

  @override
  State<NewListPage> createState() => _NewListPageState();
}

class _NewListPageState extends State<NewListPage> {
  late NewListBloc _newListBloc;

  @override
  void initState() {
    super.initState();
    _newListBloc = NewListBloc(ShoppingRepository());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New list'),
        actions: [
          BlocConsumer<NewListBloc, NewListState>(
            bloc: _newListBloc,
            listener: (_, state) {
              if (state.status == FormzStatus.submissionSuccess) {
                Navigator.of(context).pop(true);
              } else if (state.status == FormzStatus.submissionFailure) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text(state.errorMessage ?? 'Oooops'),
                      padding: const EdgeInsets.all(25),
                    ),
                  );
              }
            },
            builder: (_, state) {
              if (state.status == FormzStatus.submissionInProgress) {
                return const Padding(
                  padding: EdgeInsets.only(right: 24.0),
                  child: Center(child: Loader()),
                );
              }
              return SaveButton(
                onPressed: () => _newListBloc.add(const AddNewList()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildNameInput(),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16.0),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
              mainAxisExtent: 100,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemCount: 4,
            itemBuilder: (BuildContext ctx, index) {
              return BlocBuilder<NewListBloc, NewListState>(
                bloc: _newListBloc,
                builder: (context, state) {
                  return BackgroundItem(
                    bacground: 'assets/images/group_$index.jpg',
                    isSelected: index == state.background,
                    onTap: () => _newListBloc.add(ChangeImage(index)),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNameInput() {
    return BlocBuilder<NewListBloc, NewListState>(
      bloc: _newListBloc,
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (_, state) {
        String? errorText;
        if (state.status != FormzStatus.pure) {
          switch (state.name.error) {
            case NameValidationError.long:
              errorText = 'Too long';
              break;
            case NameValidationError.empty:
              errorText = 'Can not be empty';
              break;
            case null:
              break;
          }
        }
        return Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
          child: NameInput(
            errorText: errorText,
            onChanged: (val) => _newListBloc.add(ChangeName(val)),
          ),
        );
      },
    );
  }
}
