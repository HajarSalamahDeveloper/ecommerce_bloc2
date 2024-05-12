import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/color/color_manager.dart';
import '../../home/model/product_model.dart';

class TopProductPageDetails extends StatelessWidget {
  final ProductModel product;
  const TopProductPageDetails({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
          decoration: const BoxDecoration(color: AppColor.secondColor),
        ),
        Positioned(
            top: 30.0,
            right: ScreenUtil().screenWidth / 8,
            left: ScreenUtil().screenWidth / 8,
            child: Hero(
              tag: "${product.id}",
              child: Image.network(
                product.thumbnail!,
                height: 200.h,
                fit: BoxFit.fill,
              ),
            ))
      ],
    );
  }
}
