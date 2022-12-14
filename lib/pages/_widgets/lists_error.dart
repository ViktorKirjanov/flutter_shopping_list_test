import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_list_test/blocs/lists/lists_bloc.dart';
import 'package:flutter_shopping_list_test/config/custom_theme.dart';

class ListsError extends StatelessWidget {
  const ListsError({
    super.key,
    this.error,
  });
  final String? error;

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              error ?? 'Oops!',
              style: Theme.of(context).textTheme.caption,
            ),
            const SizedBox(height: CustomTheme.mainPadding),
            TextButton(
              child: const Text('Refresh'),
              onPressed: () =>
                  context.read<ListsBloc>().add(const GetListsEvent()),
            ),
          ],
        ),
      );
}
