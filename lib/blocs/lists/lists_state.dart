part of 'lists_bloc.dart';

class ListsState extends Equatable {
  const ListsState({
    this.status = FormzStatus.pure,
    this.lists = const [],
    this.error,
  });

  final FormzStatus status;
  final List<ShoppingList> lists;
  final String? error;

  ListsState copyWith({
    FormzStatus? status,
    List<ShoppingList>? lists,
    String? error,
  }) =>
      ListsState(
        status: status ?? this.status,
        lists: lists ?? this.lists,
        error: error ?? this.error,
      );

  @override
  List<Object?> get props => [status, lists, error];
}
