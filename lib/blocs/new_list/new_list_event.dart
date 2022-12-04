part of 'new_list_bloc.dart';

abstract class NewListEvent extends Equatable {
  const NewListEvent();

  @override
  List<Object> get props => [];
}

class CreateNewList extends NewListEvent {
  const CreateNewList();
}

class ChangeImage extends NewListEvent {
  const ChangeImage(this.index);

  final int index;

  @override
  List<Object> get props => [index];
}

class ChangeName extends NewListEvent {
  const ChangeName(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}
