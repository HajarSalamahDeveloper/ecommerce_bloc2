part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();
}

final class ProductInitial extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoading extends ProductState {
  final String messageLoading;

  const ProductLoading({required this.messageLoading});
  @override
  List<Object?> get props => [messageLoading];
}

class AllProductsSuccess extends ProductState {
  List<ProductModel> allProducts;
  AllProductsSuccess(this.allProducts);

  @override
  List<Object?> get props => [allProducts];
}

class AllProductsFail extends ProductState {
  final String error;
  const AllProductsFail(this.error);
  @override
  List<Object?> get props => [error];
}
