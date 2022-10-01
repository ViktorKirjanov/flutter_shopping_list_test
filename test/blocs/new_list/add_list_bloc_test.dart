import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_shopping_list_test/blocs/new_list/new_list_bloc.dart';
import 'package:flutter_shopping_list_test/data/shopping_repository.dart';
import 'package:flutter_shopping_list_test/models/shopping_list_model.dart';
import 'package:flutter_shopping_list_test/utils/shopping_list_name.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mocktail/mocktail.dart';

class MockShoppingRepository extends Mock implements ShoppingRepository {}

void main() {
  group('NewListBloc', () {
    late ShoppingRepository shoppingRepository;

    setUp(() {
      shoppingRepository = MockShoppingRepository();
    });

    NewListBloc buildBloc() {
      return NewListBloc(shoppingRepository);
    }

    group('constructor', () {
      test('works properly', () {
        expect(buildBloc, returnsNormally);
      });

      test('has correct initial state', () {
        expect(
          buildBloc().state,
          equals(const NewListState()),
        );
      });
    });

    group('on ChangeImage and ChangeName', () {
      blocTest<NewListBloc, NewListState>(
        'emits NewListState',
        build: buildBloc,
        act: (bloc) async {
          bloc.add(const ChangeImage(1));
          bloc.add(const ChangeImage(2));
          bloc.add(const ChangeName('Home'));
          bloc.add(const ChangeImage(3));
          bloc.add(const ChangeName(''));
          bloc.add(const ChangeName('12345678901'));
          bloc.add(const ChangeName('Home'));
        },
        expect: () => [
          const NewListState(background: 1),
          const NewListState(background: 2),
          const NewListState(
            name: ShoppingListName.dirty('Home'),
            background: 2,
            status: FormzStatus.valid,
          ),
          const NewListState(
            name: ShoppingListName.dirty('Home'),
            background: 3,
            status: FormzStatus.valid,
          ),
          const NewListState(
            name: ShoppingListName.dirty(''),
            background: 3,
            status: FormzStatus.invalid,
          ),
          const NewListState(
            name: ShoppingListName.dirty('12345678901'),
            background: 3,
            status: FormzStatus.invalid,
          ),
          const NewListState(
            name: ShoppingListName.dirty('Home'),
            background: 3,
            status: FormzStatus.valid,
          ),
        ],
      );
    });

    group('on AddNewList', () {
      blocTest<NewListBloc, NewListState>(
        'emits submissionSuccess ',
        setUp: () {
          when(
            () => shoppingRepository.addShoppingList(
                shoppingList: const ShoppingList(
              title: 'Home',
              background: 1,
              products: [],
            )),
          ).thenAnswer((_) async => {});
        },
        build: buildBloc,
        act: (bloc) async {
          bloc.add(const AddNewList());
          await Future.delayed(const Duration(seconds: 1));
        },
        seed: () => const NewListState(
          name: ShoppingListName.dirty('Home'),
          background: 1,
          status: FormzStatus.valid,
        ),
        expect: () => [
          const NewListState(
            name: ShoppingListName.dirty('Home'),
            background: 1,
            status: FormzStatus.submissionInProgress,
          ),
          const NewListState(
            name: ShoppingListName.dirty('Home'),
            background: 1,
            status: FormzStatus.submissionSuccess,
          ),
        ],
      );

      blocTest<NewListBloc, NewListState>(
        'emits submissionFailure when addShoppingList throws exception',
        setUp: () {
          when(
            () => shoppingRepository.addShoppingList(
                shoppingList: const ShoppingList(
              title: 'Home',
              background: 1,
              products: [],
            )),
          ).thenThrow(Exception());
        },
        build: buildBloc,
        act: (bloc) async {
          bloc.add(const AddNewList());
          await Future.delayed(const Duration(milliseconds: 1100));
        },
        seed: () => const NewListState(
          name: ShoppingListName.dirty('Home'),
          background: 1,
          status: FormzStatus.valid,
        ),
        expect: () => [
          const NewListState(
            name: ShoppingListName.dirty('Home'),
            background: 1,
            status: FormzStatus.submissionInProgress,
          ),
          const NewListState(
            name: ShoppingListName.dirty('Home'),
            background: 1,
            status: FormzStatus.submissionFailure,
            errorMessage: 'Something went wrong',
          ),
        ],
      );
    });
  });
}