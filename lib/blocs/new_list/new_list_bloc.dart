import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_list_test/data/firebase_shopping_repository.dart';
import 'package:flutter_shopping_list_test/utils/shopping_list_name.dart';
import 'package:formz/formz.dart';

part 'new_list_event.dart';
part 'new_list_state.dart';

class NewListBloc extends Bloc<NewListEvent, NewListState> {
  NewListBloc(this._shoppingRepository) : super(const NewListState()) {
    on<CreateNewList>(_onCreateNewList);
    on<ChangeImage>(_onChangeImage);
    on<ChangeName>(_onChangeName);
  }
  final FirebaseShoppingRepository _shoppingRepository;

  Future<void> _onCreateNewList(
    CreateNewList event,
    Emitter<NewListState> emit,
  ) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    await Future<void>.delayed(const Duration(seconds: 1));

    try {
      await _shoppingRepository.createList(
        title: state.name.value,
        background: state.background,
      );
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on Exception catch (_) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          error: 'Something went wrong',
        ),
      );
    }
  }

  Future<void> _onChangeImage(
    ChangeImage event,
    Emitter<NewListState> emit,
  ) async {
    emit(
      state.copyWith(
        background: event.index,
        status: Formz.validate([state.name]),
      ),
    );
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
