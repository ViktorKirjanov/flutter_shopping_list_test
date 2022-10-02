import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_shopping_list_test/data/shopping_repository.dart';
import 'package:flutter_shopping_list_test/models/product_model.dart';
import 'package:flutter_shopping_list_test/models/shopping_list_model.dart';
import 'package:formz/formz.dart';

part 'lists_event.dart';
part 'lists_state.dart';

class ListsBloc extends Bloc<ListsEvent, ListsState> {
  final ShoppingRepository _shoppingRepository;

  ListsBloc(this._shoppingRepository) : super(const ListsState()) {
    on<GetListsEvent>(_onGetListsEventListener);
    on<UpdatedListsEvent>(_onUpdateListsEvent);
    on<AddToListEvent>(_onAddToListEvent);
    on<RemoveFromListEvent>(_onRemoveFromListEvent);
  }

  StreamSubscription? _subscription;
  void _onGetListsEventListener(
    ListsEvent event,
    Emitter<ListsState> emit,
  ) async {
    try {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      await Future.delayed(const Duration(seconds: 2));
      _subscription =
          _shoppingRepository.getShoppingListsStream().listen((lists) {
        add(UpdatedListsEvent(lists));
      });
    } catch (_) {
      emit(state.copyWith(
        status: FormzStatus.submissionFailure,
        error: 'Something went wrong',
      ));
    }
  }

  void _onUpdateListsEvent(UpdatedListsEvent event, Emitter<ListsState> emit) {
    emit(state.copyWith(
      status: FormzStatus.submissionSuccess,
      lists: event.lists,
    ));
  }

  void _onAddToListEvent(AddToListEvent event, Emitter<ListsState> emit) {
    _shoppingRepository.addToShoppingList(id: event.id, product: event.product);
  }

  void _onRemoveFromListEvent(
      RemoveFromListEvent event, Emitter<ListsState> emit) {
    _shoppingRepository.removeFromShoppingList(
        id: event.id, product: event.product);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
