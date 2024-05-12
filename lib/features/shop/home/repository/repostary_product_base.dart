import 'package:ecommerce_bloc/features/shop/home/model/product_model.dart';

abstract class ProductRepositoryImp {
  Future<List<ProductModel>> productsApi();
}
