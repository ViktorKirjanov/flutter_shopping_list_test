import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_list_test/blocs/lists/lists_bloc.dart';

class ListsError extends StatelessWidget {
  final String? error;

  const ListsError({
    super.key,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            error ?? 'Oops!',
            style: Theme.of(context).textTheme.caption,
          ),
          const SizedBox(height: 16.0),
          TextButton(
              child: const Text('Refresh'),
              onPressed: () =>
                  context.read<ListsBloc>().add(const GetListsEvent())),
        ],
      ),
    );
  }
}
