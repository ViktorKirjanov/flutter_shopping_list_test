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
  final List<ShoppingList> lists;

  const UpdatedListsEvent(this.lists);

  @override
  List<Object> get props => [lists];
}

class AddToListEvent extends ListsEvent {
  final String id;
  final Product product;

  const AddToListEvent(this.id, this.product);

  @override
  List<Object> get props => [id, product];
}

class RemoveFromListEvent extends ListsEvent {
  final String id;
  final Product product;

  const RemoveFromListEvent(this.id, this.product);

  @override
  List<Object> get props => [id, product];
}
