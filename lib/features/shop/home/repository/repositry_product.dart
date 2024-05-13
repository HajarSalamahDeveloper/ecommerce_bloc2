import 'package:dio/dio.dart';
import 'package:ecommerce_bloc/core/app_url/app_url.dart';
import 'package:ecommerce_bloc/features/shop/home/model/product_model.dart';
import 'package:ecommerce_bloc/features/shop/home/repository/repostary_product_base.dart';

import '../../../../services_network/services.dart';

class ProductRepository extends ProductRepositoryImp {
  final ApiServices apiService;
  ProductRepository({required this.apiService});
  @override
  Future<List<ProductModel>> productsApi() async {
    try {
      Response response = await apiService.getApi(AppUrl.allProducts);
      List<dynamic> productListJson = response.data['products'];
      List<ProductModel> productList = productListJson
          .map((productJson) => ProductModel.fromJson(productJson))
          .toList();
      // print("Hager${productList.length}");
      return productList;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
