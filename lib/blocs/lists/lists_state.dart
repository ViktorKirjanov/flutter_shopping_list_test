part of 'lists_bloc.dart';

class ListsState extends Equatable {
  final FormzStatus status;
  final List<ShoppingList> lists;
  final String? error;

  const ListsState({
    this.status = FormzStatus.pure,
    this.lists = const [],
    this.error,
  });

  ListsState copyWith({
    FormzStatus? status,
    List<ShoppingList>? lists,
    String? error,
  }) {
    return ListsState(
      status: status ?? this.status,
      lists: lists ?? this.lists,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, lists, error];
}
