import 'package:flutter_shopping_list_test/blocs/new_list/new_list_bloc.dart';
import 'package:flutter_shopping_list_test/utils/shopping_list_name.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';

void main() {
  group('NewListState', () {
    test('supports value comparisons', () {
      expect(
        const NewListState(),
        const NewListState(),
      );
    });

    test('returns same object when no properties are passed', () {
      expect(
        const NewListState().copyWith(),
        const NewListState(),
      );
    });

    group('returns object with updated status when status is passed.', () {
      test('pure', () {
        expect(
          const NewListState().copyWith(status: FormzStatus.pure),
          const NewListState(),
        );
      });

      test('invalid', () {
        expect(
          const NewListState().copyWith(status: FormzStatus.invalid),
          const NewListState(status: FormzStatus.invalid),
        );
      });

      test('submissionCanceled', () {
        expect(
          const NewListState().copyWith(status: FormzStatus.submissionCanceled),
          const NewListState(status: FormzStatus.submissionCanceled),
        );
      });

      test('submissionFailure', () {
        expect(
          const NewListState().copyWith(
            status: FormzStatus.submissionFailure,
            error: 'ooops',
          ),
          const NewListState(
            status: FormzStatus.submissionFailure,
            error: 'ooops',
          ),
        );
      });

      test('submissionInProgress', () {
        expect(
          const NewListState()
              .copyWith(status: FormzStatus.submissionInProgress),
          const NewListState(status: FormzStatus.submissionInProgress),
        );
      });

      test('submissionSuccess', () {
        expect(
          const NewListState().copyWith(status: FormzStatus.submissionSuccess),
          const NewListState(status: FormzStatus.submissionSuccess),
        );
      });

      test('valid', () {
        expect(
          const NewListState().copyWith(status: FormzStatus.valid),
          const NewListState(status: FormzStatus.valid),
        );
      });
    });

    test('returns submissionSuccess object ', () {
      expect(
        const NewListState().copyWith(
          name: const ShoppingListName.dirty('Home'),
          background: 1,
          status: FormzStatus.submissionSuccess,
        ),
        const NewListState(
          name: ShoppingListName.dirty('Home'),
          background: 1,
          status: FormzStatus.submissionSuccess,
          error: null,
        ),
      );
    });
  });
}
