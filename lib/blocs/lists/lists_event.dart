part of 'lists_bloc.dart';

abstract class ListsEvent extends Equatable {
  const ListsEvent();

  @override
  List<Object> get props => [];
}

class GetListsEvent extends ListsEvent {
  const GetListsEvent();
}

class UpdatedListsEvent extends ListsEvent {
  const UpdatedListsEvent(this.lists);

  final List<ShoppingList> lists;

  @override
  List<Object> get props => [lists];
}

class AddToListEvent extends ListsEvent {
  const AddToListEvent(this.id, this.product);

  final String id;
  final Product product;

  @override
  List<Object> get props => [id, product];
}

class RemoveFromListEvent extends ListsEvent {
  const RemoveFromListEvent(this.id, this.product);

  final String id;
  final Product product;

  @override
  List<Object> get props => [id, product];
}

class ClearProductListEvent extends ListsEvent {
  const ClearProductListEvent(this.id);

  final String id;

  @override
  List<Object> get props => [id];
}

class UpdateProductListEvent extends ListsEvent {
  const UpdateProductListEvent(
    this.listId,
    this.product,
  );

  final String listId;
  final Product product;

  @override
  List<Object> get props => [listId, product];
}
