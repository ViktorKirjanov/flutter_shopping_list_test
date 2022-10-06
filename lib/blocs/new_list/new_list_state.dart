part of 'new_list_bloc.dart';

class NewListState extends Equatable {
  final ShoppingListName name;
  final int background;
  final FormzStatus status;
  final String? error;

  const NewListState({
    this.name = const ShoppingListName.pure(),
    this.background = 0,
    this.status = FormzStatus.pure,
    this.error,
  });

  NewListState copyWith({
    ShoppingListName? name,
    int? background,
    FormzStatus? status,
    String? error,
  }) {
    return NewListState(
      name: name ?? this.name,
      background: background ?? this.background,
      status: status ?? this.status,
      error: error,
    );
  }

  @override
  List<Object?> get props => [status, name, background, error];
}
