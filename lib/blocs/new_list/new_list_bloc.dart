import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_list_test/data/shopping_repository.dart';
import 'package:flutter_shopping_list_test/models/shopping_list_model.dart';
import 'package:flutter_shopping_list_test/utils/shopping_list_name.dart';
import 'package:formz/formz.dart';

part 'new_list_event.dart';
part 'new_list_state.dart';

class NewListBloc extends Bloc<NewListEvent, NewListState> {
  final ShoppingRepository _shoppingRepository;

  NewListBloc(this._shoppingRepository) : super(const NewListState()) {
    on<AddNewList>(_onAddNewList);
    on<ChangeImage>(_onChangeImage);
    on<ChangeName>(_onChangeName);
  }

  Future<void> _onAddNewList(
    AddNewList event,
    Emitter<NewListState> emit,
  ) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    await Future.delayed(const Duration(seconds: 1));

    try {
      var newList = ShoppingList(
        title: state.name.value,
        background: state.background,
        products: const [],
      );

      await _shoppingRepository.addShoppingList(shoppingList: newList);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (e) {
      emit(state.copyWith(
        status: FormzStatus.submissionFailure,
        errorMessage: 'Something went wrong',
      ));
    }
  }

  Future<void> _onChangeImage(
    ChangeImage event,
    Emitter<NewListState> emit,
  ) async {
    emit(state.copyWith(
      background: event.index,
      status: Formz.validate([state.name]),
    ));
  }

  Future<void> _onChangeName(
    ChangeName event,
    Emitter<NewListState> emit,
  ) async {
    final name = ShoppingListName.dirty(event.name);

    emit(
      state.copyWith(
        name: name,
        status: Formz.validate([name]),
      ),
    );
  }
}
