import 'dart:async';

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_list_test/data/firebase_shopping_repository.dart';
import 'package:flutter_shopping_list_test/models/product_model.dart';
import 'package:flutter_shopping_list_test/models/shopping_list_model.dart';
import 'package:formz/formz.dart';

part 'lists_event.dart';
part 'lists_state.dart';

class ListsBloc extends Bloc<ListsEvent, ListsState> {
  ListsBloc(this._shoppingRepository) : super(const ListsState()) {
    on<GetListsEvent>(_onGetListsEventListener);
    on<UpdatedListsEvent>(_onUpdateListsEvent);
    on<AddToListEvent>(_onAddToListEvent);
    on<RemoveFromListEvent>(_onRemoveFromListEvent);
    on<ClearProductListEvent>(_onClearProductListEvent);
    on<UpdateProductListEvent>(_onUpdateProductListEvent);
  }

  final FirebaseShoppingRepository _shoppingRepository;

  StreamSubscription<List<ShoppingList>>? _subscription;
  Future<void> _onGetListsEventListener(
    ListsEvent event,
    Emitter<ListsState> emit,
  ) async {
    try {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      await Future<void>.delayed(const Duration(seconds: 2));
      _subscription =
          _shoppingRepository.getShoppingListsStream().listen((lists) {
        add(UpdatedListsEvent(lists));
      });
    } on Exception catch (_) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          error: 'Something went wrong',
        ),
      );
    }
  }

  void _onUpdateListsEvent(
    UpdatedListsEvent event,
    Emitter<ListsState> emit,
  ) {
    emit(
      state.copyWith(
        status: FormzStatus.submissionSuccess,
        lists: event.lists,
      ),
    );
  }

  Future<void> _onAddToListEvent(
    AddToListEvent event,
    Emitter<ListsState> emit,
  ) async {
    try {
      await _shoppingRepository.addToList(id: event.id, product: event.product);
    } on Exception catch (_) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          error: 'Something went wrong',
        ),
      );
    }
  }

  Future<void> _onRemoveFromListEvent(
    RemoveFromListEvent event,
    Emitter<ListsState> emit,
  ) async {
    try {
      await _shoppingRepository.removeFromList(
        id: event.id,
        product: event.product,
      );
    } on Exception catch (_) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          error: 'Something went wrong',
        ),
      );
    }
  }

  Future<void> _onClearProductListEvent(
    ClearProductListEvent event,
    Emitter<ListsState> emit,
  ) async {
    try {
      await _shoppingRepository.clearShoppingList(id: event.id);
    } on Exception catch (_) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          error: 'Something went wrong',
        ),
      );
    }
  }

  Future<void> _onUpdateProductListEvent(
    UpdateProductListEvent event,
    Emitter<ListsState> emit,
  ) async {
    try {
      final list =
          state.lists.firstWhereOrNull((list) => list.id == event.listId);
      if (list != null) {
        final index = list.products.indexWhere((p) => p == event.product);
        if (index != -1) {
          final List<Product> newLists = List.from(list.products);
          newLists[index] =
              newLists[index].copyWith(isSelected: !newLists[index].isSelected);
          await _shoppingRepository.updateList(
            id: event.listId,
            products: newLists,
          );
        }
      }
    } on Exception catch (_) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          error: 'Something went wrong',
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
