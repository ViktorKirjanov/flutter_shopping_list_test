part of 'new_list_bloc.dart';

abstract class NewListEvent extends Equatable {
  const NewListEvent();

  @override
  List<Object> get props => [];
}

class AddNewList extends NewListEvent {
  const AddNewList();
}

class ChangeImage extends NewListEvent {
  final int index;

  const ChangeImage(this.index);

  @override
  List<Object> get props => [index];
}

class ChangeName extends NewListEvent {
  final String name;

  const ChangeName(this.name);

  @override
  List<Object> get props => [name];
}
