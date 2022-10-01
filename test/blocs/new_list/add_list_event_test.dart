import 'package:flutter_shopping_list_test/blocs/new_list/new_list_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NewListEvent', () {
    group('AddNewList', () {
      test('supports value equality', () {
        expect(
          const AddNewList(),
          equals(const AddNewList()),
        );
      });

      test('props are correct', () {
        expect(
          const AddNewList().props,
          equals(<Object?>[]),
        );
      });
    });

    group('ChangeImage', () {
      test('supports value equality', () {
        expect(
          const ChangeImage(1),
          equals(const ChangeImage(1)),
        );
      });

      test('props are correct', () {
        expect(
          const ChangeImage(1).props,
          equals(<Object?>[1]),
        );
      });
    });

    group('ChangeName', () {
      test('supports value equality', () {
        expect(
          const ChangeName('Home'),
          equals(const ChangeName('Home')),
        );
      });

      test('props are correct', () {
        expect(
          const ChangeName('Home').props,
          equals(<Object?>['Home']),
        );
      });
    });
  });
}
