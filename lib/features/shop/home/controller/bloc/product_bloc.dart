import 'package:bloc/bloc.dart';
import 'package:ecommerce_bloc/features/shop/home/model/product_model.dart';
import 'package:equatable/equatable.dart';

import '../../repository/repositry_product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  List<ProductModel> products = [];
  ProductBloc(this.productRepository) : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async {
      if (event is GetAllProducts) {
        emit(ProductLoading(messageLoading: "Loading...."));
        try {
          products = await productRepository.productsApi();
          emit(AllProductsSuccess(products));
        } catch (e) {
          emit(AllProductsFail(e.toString()));
          print(e);
        }
      }
    });
  }
}
