import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_list_test/blocs/new_list/new_list_bloc.dart';
import 'package:flutter_shopping_list_test/config/custom_theme.dart';
import 'package:flutter_shopping_list_test/data/firebase_shopping_repository.dart';
import 'package:flutter_shopping_list_test/pages/_widgets/loader.dart';
import 'package:flutter_shopping_list_test/pages/new_list_page/_widgets/widgets.dart';
import 'package:flutter_shopping_list_test/utils/shopping_list_name.dart';
import 'package:formz/formz.dart';

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
    _newListBloc = NewListBloc(FirebaseShoppingRepository());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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
                        content: Text(state.error ?? 'Oooops'),
                        padding: const EdgeInsets.all(24.0),
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
                  onPressed: () => _newListBloc.add(const CreateNewList()),
                );
              },
            ),
          ],
        ),
        body: Padding(
          padding: CustomTheme.contentPadding,
          child: Column(
            children: [
              _buildNameInput(),
              const SizedBox(height: CustomTheme.mainPadding),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: MediaQuery.of(context).size.width /
                      CustomTheme.newShoppingInRow,
                  mainAxisExtent: CustomTheme.newShoppingHeight,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemCount: 4,
                itemBuilder: (BuildContext ctx, index) =>
                    BlocBuilder<NewListBloc, NewListState>(
                  bloc: _newListBloc,
                  builder: (context, state) => BackgroundItem(
                    bacground: 'assets/images/group_$index.jpg',
                    isSelected: index == state.background,
                    onTap: () => _newListBloc.add(ChangeImage(index)),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildNameInput() => BlocBuilder<NewListBloc, NewListState>(
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
          return NameInput(
            errorText: errorText,
            onChanged: (val) => _newListBloc.add(ChangeName(val)),
          );
        },
      );
}
