import 'package:flutter_shopping_list_test/models/product_model.dart';
import 'package:flutter_shopping_list_test/models/shopping_list_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_shopping_list_test/blocs/lists/lists_bloc.dart';
import 'package:formz/formz.dart';

void main() {
  group('ListsState', () {
    test('supports value comparisons', () {
      expect(
        const ListsState(),
        const ListsState(),
      );
    });

    test('returns same object when no properties are passed', () {
      expect(
        const ListsState().copyWith(),
        const ListsState(),
      );
    });

    group('returns object with updated status when status is passed.', () {
      test('pure', () {
        expect(
          const ListsState().copyWith(status: FormzStatus.pure),
          const ListsState(),
        );
      });

      test('invalid', () {
        expect(
          const ListsState().copyWith(status: FormzStatus.invalid),
          const ListsState(status: FormzStatus.invalid),
        );
      });

      test('submissionCanceled', () {
        expect(
          const ListsState().copyWith(status: FormzStatus.submissionCanceled),
          const ListsState(status: FormzStatus.submissionCanceled),
        );
      });

      test('submissionFailure', () {
        expect(
          const ListsState().copyWith(
            status: FormzStatus.submissionFailure,
            error: 'ooops',
          ),
          const ListsState(
            status: FormzStatus.submissionFailure,
            error: 'ooops',
          ),
        );
      });

      test('submissionInProgress', () {
        expect(
          const ListsState().copyWith(status: FormzStatus.submissionInProgress),
          const ListsState(status: FormzStatus.submissionInProgress),
        );
      });

      test('submissionSuccess', () {
        expect(
          const ListsState().copyWith(status: FormzStatus.submissionSuccess),
          const ListsState(status: FormzStatus.submissionSuccess),
        );
      });

      test('valid', () {
        expect(
          const ListsState().copyWith(status: FormzStatus.valid),
          const ListsState(status: FormzStatus.valid),
        );
      });
    });

    test('returns object with updated lists when email is lists', () {
      expect(
        const ListsState().copyWith(lists: [
          const ShoppingList(
            title: 'title',
            background: 1,
            products: [Product(name: 'Bananas', image: 'bananas')],
          )
        ]),
        const ListsState(lists: [
          ShoppingList(
            title: 'title',
            background: 1,
            products: [Product(name: 'Bananas', image: 'bananas')],
          )
        ]),
      );
    });
  });
}
