import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_shopping_list_test/blocs/lists/lists_bloc.dart';
import 'package:flutter_shopping_list_test/data/shopping_repository.dart';
import 'package:flutter_shopping_list_test/models/shopping_list_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mocktail/mocktail.dart';

class MockShoppingRepository extends Mock implements ShoppingRepository {}

void main() {
  group('ListsBloc', () {
    late ShoppingRepository shoppingRepository;

    setUp(() {
      shoppingRepository = MockShoppingRepository();
    });

    ListsBloc buildBloc() {
      return ListsBloc(shoppingRepository);
    }

    group('constructor', () {
      test('works properly', () {
        expect(buildBloc, returnsNormally);
      });

      test('has correct initial state', () {
        expect(
          buildBloc().state,
          equals(const ListsState()),
        );
      });
    });

    blocTest<ListsBloc, ListsState>(
      'on GetListsEvent',
      build: buildBloc,
      act: (bloc) async => bloc.add(const GetListsEvent()),
      expect: () => [
        const ListsState(status: FormzStatus.submissionInProgress),
      ],
    );

    blocTest<ListsBloc, ListsState>(
      'on UpdatedListsEvent',
      build: buildBloc,
      act: (bloc) async => bloc.add(
        const UpdatedListsEvent([
          ShoppingList(title: 'title', background: 1, products: ['xxx', 'zzz'])
        ]),
      ),
      expect: () => [
        const ListsState(
          lists: [
            ShoppingList(
              title: 'title',
              background: 1,
              products: ['xxx', 'zzz'],
            )
          ],
          status: FormzStatus.submissionSuccess,
          error: null,
        ),
      ],
    );
  });
}
