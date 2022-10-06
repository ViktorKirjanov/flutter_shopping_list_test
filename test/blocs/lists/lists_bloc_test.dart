import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_shopping_list_test/blocs/lists/lists_bloc.dart';
import 'package:flutter_shopping_list_test/data/firebase_shopping_repository.dart';
import 'package:flutter_shopping_list_test/models/product_model.dart';
import 'package:flutter_shopping_list_test/models/shopping_list_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mocktail/mocktail.dart';

class MockShoppingRepository extends Mock
    implements FirebaseShoppingRepository {}

void main() {
  group('ListsBloc', () {
    late FirebaseShoppingRepository shoppingRepository;

    var product = const Product(
      name: 'Bananas',
      image: 'bananas',
      isSelected: true,
    );

    var shoppingList = ShoppingList(
      id: 'shoppingListId',
      title: 'title',
      background: 1,
      products: [product],
    );

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
        UpdatedListsEvent([shoppingList]),
      ),
      expect: () => [
        ListsState(
          lists: [shoppingList],
          status: FormzStatus.submissionSuccess,
          error: null,
        ),
      ],
    );

    group('on ClearProductListEvent', (() {
      blocTest<ListsBloc, ListsState>(
        'success',
        setUp: () {
          when(
            () => shoppingRepository.clearShoppingList(id: 'listId'),
          ).thenAnswer((_) async => {});
        },
        build: buildBloc,
        act: (bloc) async {
          bloc.add(const ClearProductListEvent('listId'));
          await Future.delayed(const Duration(seconds: 1));
        },
        expect: () => [],
      );

      blocTest<ListsBloc, ListsState>(
        'throw Exception when clearShoppingList',
        setUp: () {
          when(
            () => shoppingRepository.clearShoppingList(id: 'listId'),
          ).thenThrow(Exception());
        },
        seed: () => ListsState(
          status: FormzStatus.submissionSuccess,
          lists: [shoppingList],
        ),
        build: buildBloc,
        act: (bloc) async {
          bloc.add(const ClearProductListEvent('listId'));
        },
        expect: () => [
          ListsState(
            status: FormzStatus.submissionFailure,
            lists: [shoppingList],
            error: 'Something went wrong',
          )
        ],
      );
    }));

    group('on ClearProductListEvent', (() {
      blocTest<ListsBloc, ListsState>(
        'success',
        setUp: () {
          when(
            () => shoppingRepository.updateList(
              id: 'listId',
              products: [product],
            ),
          ).thenAnswer((_) async => {});
        },
        build: buildBloc,
        act: (bloc) async {
          bloc.add(UpdateProductListEvent(
            'listId',
            product,
          ));
        },
        expect: () => [],
      );

      blocTest<ListsBloc, ListsState>(
        'throw Exception when updateShoppingList',
        setUp: () {
          when(
            () => shoppingRepository.updateList(
              id: 'listId',
              products: [product],
            ),
          ).thenThrow(Exception());
        },
        seed: () => ListsState(
          status: FormzStatus.submissionSuccess,
          lists: [shoppingList],
        ),
        build: buildBloc,
        act: (bloc) async {
          bloc.add(const ClearProductListEvent('listId'));
        },
        expect: () => [
          ListsState(
            status: FormzStatus.submissionFailure,
            lists: [shoppingList],
            error: 'Something went wrong',
          )
        ],
      );
    }));
  });
}
