import 'package:ecommerce_bloc/core/color/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  final String titleappbar;
  final void Function()? onPressedIconFavorite;
  final void Function()? onPressedSearch;
  final void Function(String)? onChanged;
  // final TextEditingController mycontroller;
  final IconData iconData;
  const CustomAppBar(
      {Key? key,
      required this.titleappbar,
      this.onPressedSearch,
      required this.onPressedIconFavorite,
      this.onChanged,
      // required this.mycontroller,
      this.iconData = Icons.favorite_border_outlined})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(children: [
        Expanded(
            child: TextFormField(
          // controller: mycontroller,
          onChanged: onChanged,
          decoration: InputDecoration(
              prefixIcon: IconButton(
                  icon: Icon(Icons.search), onPressed: onPressedSearch),
              hintText: titleappbar,
              hintStyle: TextStyle(fontSize: 18),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: AppColor.lightGrey),
        )),
        SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
              color: AppColor.lightGrey,
              borderRadius: BorderRadius.circular(10)),
          width: 60.w,
          padding: EdgeInsets.symmetric(vertical: 8),
          child: IconButton(
              onPressed: onPressedIconFavorite,
              icon: Icon(
                iconData,
                size: 30,
                color: AppColor.semiTransparentGrey,
              )),
        )
      ]),
    );
  }
}
