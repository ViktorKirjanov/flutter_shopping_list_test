import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_list_test/blocs/products/products_state.dart';

import '../../data/products_repository.dart';

part 'products_event.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository _productsRepository;

  ProductsBloc(this._productsRepository) : super(const ProductsState()) {
    on<GetProductsEvent>(_onGetProductsEvent);
  }

  Future<void> _onGetProductsEvent(
    GetProductsEvent event,
    Emitter<ProductsState> emit,
  ) async {
    emit(state.copyWith(status: ProductsStatus.loading));
    try {
      var groups = await _productsRepository.getProducts();
      groups.sort((a, b) => a.order.compareTo(b.order));
      for (var element in groups) {
        element.products.sort((a, b) => a.name.compareTo(b.name));
      }

      emit(state.copyWith(
        status: ProductsStatus.success,
        groups: groups,
      ));
    } catch (_) {
      emit(state.copyWith(
        status: ProductsStatus.failure,
        error: 'Something went wrong',
      ));
    }
  }
}
