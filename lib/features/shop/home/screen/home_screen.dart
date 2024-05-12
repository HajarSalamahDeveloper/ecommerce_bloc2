import 'package:ecommerce_bloc/features/shop/home/controller/bloc/product_bloc.dart';
import 'package:ecommerce_bloc/features/shop/home/screen/widget/custom_app_bar.dart';
import 'package:ecommerce_bloc/features/shop/home/screen/widget/custom_card_list.dart';
import 'package:ecommerce_bloc/features/shop/home/screen/widget/general_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(children: [
          CustomAppBar(
              titleappbar: 'Find Product', onPressedIconFavorite: () {}),
          buildContent()
        ]));
  }

  Widget buildContent() {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is AllProductsSuccess) {
          // if (state.allProducts.isEmpty) {
          //   return Center(
          //     child: Text('No products available.'),
          //   );
          // }
          return GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: state.allProducts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (BuildContext context, index) {
              return CustomListItems(itemsModel: state.allProducts[index]);
            },
          );
        } else if (state is AllProductsFail) {
          return GeneralExceptionWidget(
            onPress: () {
              BlocProvider.of<ProductBloc>(context).add(GetAllProducts());
            },
          );
        } else if (state is ProductLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Center(
          child: Text("Loading"),
        );
        // }
      },
    );
  }
}
