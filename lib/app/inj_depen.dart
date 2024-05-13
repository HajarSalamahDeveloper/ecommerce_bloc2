import 'package:ecommerce_bloc/features/shop/home/controller/bloc/product_bloc.dart';
import 'package:ecommerce_bloc/features/shop/home/repository/repositry_product.dart';
import 'package:ecommerce_bloc/services_network/services.dart';
import 'package:get_it/get_it.dart';

import '../features/navgation_button_bar/bloc/navgation_bottom_bar_bloc.dart';

final getIt = GetIt.instance;

Future<void> setupDependencyInjection() async {
  getIt.registerFactory(() => NavgationBottomBarBloc());

  getIt.registerLazySingleton<ApiServices>(() => ApiServices());
  getIt.registerLazySingleton<ProductRepository>(
      () => ProductRepository(apiService: getIt()));
  // getIt.registerFactory(() => ProductBloc(
  //       productRepository: getIt<ProductRepository>(),
  //     ));
  getIt.registerFactory<ProductBloc>(
      () => ProductBloc(productRepository: getIt<ProductRepository>()));
}
