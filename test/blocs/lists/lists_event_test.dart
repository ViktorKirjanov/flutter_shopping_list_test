import 'package:flutter_shopping_list_test/blocs/lists/lists_bloc.dart';
import 'package:flutter_shopping_list_test/models/product_model.dart';
import 'package:flutter_shopping_list_test/models/shopping_list_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ListsEvent', () {
    group('GetListsEvent', () {
      test('supports value equality', () {
        expect(
          const GetListsEvent(),
          equals(const GetListsEvent()),
        );
      });

      test('props are correct', () {
        expect(
          const GetListsEvent().props,
          equals(<Object?>[]),
        );
      });
    });

    group('UpdatedListsEvent', () {
      test('supports value equality', () {
        expect(
          const UpdatedListsEvent([
            ShoppingList(
                title: 'title',
                background: 1,
                products: [Product(name: 'Bananas', image: 'bananas')])
          ]),
          equals(const UpdatedListsEvent([
            ShoppingList(
                title: 'title',
                background: 1,
                products: [Product(name: 'Bananas', image: 'bananas')])
          ])),
        );
      });

      test('props are correct', () {
        expect(
          const UpdatedListsEvent([
            ShoppingList(
                title: 'title',
                background: 1,
                products: [Product(name: 'Bananas', image: 'bananas')])
          ]).props,
          equals(<Object?>[
            const [
              ShoppingList(
                  title: 'title',
                  background: 1,
                  products: [Product(name: 'Bananas', image: 'bananas')])
            ],
          ]),
        );
      });
    });

    group('AddToListEvent', () {
      test('supports value equality', () {
        expect(
          const AddToListEvent(
            "listId",
            Product(name: 'Bananas', image: 'bananas'),
          ),
          equals(
            const AddToListEvent(
              "listId",
              Product(name: 'Bananas', image: 'bananas'),
            ),
          ),
        );
      });

      test('props are correct', () {
        expect(
          const AddToListEvent(
            "listId",
            Product(name: 'Bananas', image: 'bananas'),
          ).props,
          equals(<Object?>[
            "listId",
            const Product(name: 'Bananas', image: 'bananas'),
          ]),
        );
      });
    });

    group('RemoveFromListEvent', () {
      test('supports value equality', () {
        expect(
          const RemoveFromListEvent(
            "listId",
            Product(name: 'Bananas', image: 'bananas'),
          ),
          equals(
            const RemoveFromListEvent(
              "listId",
              Product(name: 'Bananas', image: 'bananas'),
            ),
          ),
        );
      });

      test('props are correct', () {
        expect(
          const RemoveFromListEvent(
            "listId",
            Product(name: 'Bananas', image: 'bananas'),
          ).props,
          equals(<Object?>[
            "listId",
            const Product(name: 'Bananas', image: 'bananas'),
          ]),
        );
      });
    });
  });
}
