import 'package:ecommerce_bloc/core/style_manager/style_manger.dart';
import 'package:ecommerce_bloc/route_mangment/AppRoute.dart';
import 'package:flutter/material.dart';

import '../../../../core/color/color_manager.dart';
import '../../home/model/product_model.dart';
import '../component/product_price_count.dart';
import '../component/top_product_details.dart';

class ProductDetail extends StatelessWidget {
  final ProductModel productDetail;
  ProductDetail({Key? key, required this.productDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 50,
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: AppColor.secondColor,
                onPressed: () {
                  Navigator.pushNamed(context, AppRoute.productDetails);
                },
                child: const Text(
                  "Add To Cart",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))),
        body: ListView(children: [
          TopProductPageDetails(
            product: productDetail,
          ),
          const SizedBox(
            height: 100,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(productDetail.title!,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: AppColor.fourthColor,
                      )),
              const SizedBox(height: 10),
              PriceAndCountItems(
                  onAdd: () {
                    // controller.add();
                  },
                  onRemove: () {
                    // controller.remove();
                  },
                  price: "${productDetail.price!}",
                  count: "10"
                  // "${productDetail.countitems}"
                  ),
              const SizedBox(height: 10),
              Text("${productDetail.description}",
                  style: getContentStyle(color: AppColor.black)),
              const SizedBox(height: 10),
            ]),
          )
        ]));
  }
}
