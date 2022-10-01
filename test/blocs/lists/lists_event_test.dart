import 'package:flutter_shopping_list_test/blocs/lists/lists_bloc.dart';
import 'package:flutter_shopping_list_test/models/shopping_list_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ListsEvent', () {
    group('UpdatedListsEvent', () {
      test('supports value equality', () {
        expect(
          const UpdatedListsEvent([
            ShoppingList(title: 'title', background: 1, products: [
              'xxx',
              'zzz',
            ])
          ]),
          equals(const UpdatedListsEvent([
            ShoppingList(title: 'title', background: 1, products: [
              'xxx',
              'zzz',
            ])
          ])),
        );
      });

      test('props are correct', () {
        expect(
          const UpdatedListsEvent([
            ShoppingList(title: 'title', background: 1, products: [
              'xxx',
              'zzz',
            ])
          ]).props,
          equals(<Object?>[
            const [
              ShoppingList(title: 'title', background: 1, products: [
                'xxx',
                'zzz',
              ])
            ],
          ]),
        );
      });
    });
  });
}
