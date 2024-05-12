import 'package:ecommerce_bloc/features/navgation_button_bar/bloc/navgation_bottom_bar_bloc.dart';
import 'package:ecommerce_bloc/features/shop/home/model/product_model.dart';
import 'package:ecommerce_bloc/features/shop/home/screen/home_screen.dart';
import 'package:ecommerce_bloc/features/shop/product_detailes/screen/product_detailes.dart';
import 'package:ecommerce_bloc/features/splash_feature/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/navgation_button_bar/screen_nav.dart';
import '../features/shop/cart/screen/cart_screen.dart';
import '../features/shop/favorite/screen/favorit_screen.dart';
import '../features/shop/home/controller/bloc/product_bloc.dart';
import '../features/shop/home/repository/repositry_product.dart';
import 'AppRoute.dart';

class AppRoutes {
  late ProductRepository productRepository;
  late NavgationBottomBarBloc navBottomBloc;
  late ProductBloc productBloc;

  AppRoutes() {
    navBottomBloc = NavgationBottomBarBloc();
    productRepository = ProductRepository();
    productBloc = ProductBloc(productRepository);
  }
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoute.homeScreenNav:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(providers: [
                  BlocProvider.value(value: productBloc..add(GetAllProducts())),
                  BlocProvider.value(value: navBottomBloc),
                ], child: HomeScreenBottomNav()));
      case AppRoute.homepage:
        return MaterialPageRoute(
            builder: (_) =>
                // BlocProvider(
                // create: (BuildContext contxt) =>
                //     productBloc..add(GetAllProducts()),
                // child:
                HomePage());
      // );
      case AppRoute.productDetails:
        final productDetail = settings.arguments as ProductModel;
        return MaterialPageRoute(
            builder: (_) => ProductDetail(
                  productDetail: productDetail,
                ));
      case AppRoute.myFavorite:
        return MaterialPageRoute(builder: (_) => const FavoriteScreen());
      case AppRoute.cart:
        return MaterialPageRoute(builder: (_) => const Cart());
      default:
        return null;
    }
  }
}
