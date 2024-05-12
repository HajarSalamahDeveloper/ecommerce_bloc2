part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();
}

class GetAllProducts extends ProductEvent {
  @override
  List<Object?> get props => [];
}
