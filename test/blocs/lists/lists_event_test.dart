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
              id: 'shoppingListId',
              title: 'title',
              background: 1,
              products: [
                Product(
                  name: 'Bananas',
                  image: 'bananas',
                  isSelected: true,
                )
              ],
            )
          ]),
          equals(
            const UpdatedListsEvent([
              ShoppingList(
                id: 'shoppingListId',
                title: 'title',
                background: 1,
                products: [
                  Product(
                    name: 'Bananas',
                    image: 'bananas',
                    isSelected: true,
                  )
                ],
              )
            ]),
          ),
        );
      });

      test('props are correct', () {
        expect(
          const UpdatedListsEvent([
            ShoppingList(
              id: 'shoppingListId',
              title: 'title',
              background: 1,
              products: [
                Product(
                  name: 'Bananas',
                  image: 'bananas',
                  isSelected: true,
                )
              ],
            )
          ]).props,
          equals(<Object?>[
            const [
              ShoppingList(
                id: 'shoppingListId',
                title: 'title',
                background: 1,
                products: [
                  Product(
                    name: 'Bananas',
                    image: 'bananas',
                    isSelected: true,
                  )
                ],
              )
            ],
          ]),
        );
      });
    });

    group('AddToListEvent', () {
      test('supports value equality', () {
        expect(
          const AddToListEvent(
            'listId',
            Product(
              name: 'Bananas',
              image: 'bananas',
              isSelected: true,
            ),
          ),
          equals(
            const AddToListEvent(
              'listId',
              Product(
                name: 'Bananas',
                image: 'bananas',
                isSelected: true,
              ),
            ),
          ),
        );
      });

      test('props are correct', () {
        expect(
          const AddToListEvent(
            'listId',
            Product(
              name: 'Bananas',
              image: 'bananas',
              isSelected: true,
            ),
          ).props,
          equals(<Object?>[
            'listId',
            const Product(
              name: 'Bananas',
              image: 'bananas',
              isSelected: true,
            ),
          ]),
        );
      });
    });

    group('RemoveFromListEvent', () {
      test('supports value equality', () {
        expect(
          const RemoveFromListEvent(
            'listId',
            Product(
              name: 'Bananas',
              image: 'bananas',
              isSelected: true,
            ),
          ),
          equals(
            const RemoveFromListEvent(
              'listId',
              Product(
                name: 'Bananas',
                image: 'bananas',
                isSelected: true,
              ),
            ),
          ),
        );
      });

      test('props are correct', () {
        expect(
          const RemoveFromListEvent(
            'listId',
            Product(
              name: 'Bananas',
              image: 'bananas',
              isSelected: true,
            ),
          ).props,
          equals(<Object?>[
            'listId',
            const Product(
              name: 'Bananas',
              image: 'bananas',
              isSelected: true,
            ),
          ]),
        );
      });
    });

    group('ClearProductListEvent', () {
      test('supports value equality', () {
        expect(
          const ClearProductListEvent('listId'),
          equals(const ClearProductListEvent('listId')),
        );
      });

      test('props are correct', () {
        expect(
          const ClearProductListEvent(
            'listId',
          ).props,
          equals(<Object?>['listId']),
        );
      });
    });

    group('UpdateProductListEvent', () {
      test('supports value equality', () {
        expect(
          const UpdateProductListEvent(
            'listId',
            Product(
              name: 'Bananas',
              image: 'bananas',
              isSelected: true,
            ),
          ),
          equals(
            const UpdateProductListEvent(
              'listId',
              Product(
                name: 'Bananas',
                image: 'bananas',
                isSelected: true,
              ),
            ),
          ),
        );
      });

      test('props are correct', () {
        expect(
          const UpdateProductListEvent(
            'listId',
            Product(
              name: 'Bananas',
              image: 'bananas',
              isSelected: true,
            ),
          ).props,
          equals(<Object?>[
            'listId',
            const Product(
              name: 'Bananas',
              image: 'bananas',
              isSelected: true,
            ),
          ]),
        );
      });
    });
  });
}
