// import 'package:ecommerce_bloc/features/shop/favorite/screen/favorit_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
//
// import '../../../controller/home_controller/home_bottem_tab_controller.dart';
// import '../../profile/screen/profile_screen.dart';
// import '../../setting/screen/setting.dart';
// import '../../shop/home/screen/home_screen.dart';
// import '../bloc/navgation_bottom_bar_bloc.dart';
// import 'custom_button.dart';
//
// class CustomBottomAppBarHome extends StatelessWidget {
//   List<Widget> listPage = [
//     HomePage(),
//     FavoriteScreen(),
//     ProfilePage(),
//     Setting()
//   ];
//   List bottomappbar = [
//     {"title": "home", "icon": Icons.home},
//     {"title": "favorite", "icon": Icons.favorite},
//     {"title": "profile", "icon": Icons.person},
//     {"title": "settings", "icon": Icons.settings}
//   ];
//    CustomBottomAppBarHome({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<NavgationBottomBarBloc, NavgationBottomBarEvent>(
//         builder: (context, currentPage) {
//           return BottomAppBar(
//               shape: const CircularNotchedRectangle(),
//               notchMargin: 10,
//               child: Row(
//                 children: [
//                   ...List.generate(listPage.length + 1, ((index) {
//                     int i = index > 2 ? index - 1 : index;
//                     return index == 2
//                         ? const Spacer()
//                         : CustomButtonAppBar(
//                         textbutton: bottomappbar[i]['title'],
//                         icondata: bottomappbar[i]['icon'],
//                         onPressed: () {
//                           controller.changePage(i);
//                         },
//                         active: controller.currentpage == i ? true : false);
//                   }))
//                 ],
//               ))
//         });
//   }
// }
