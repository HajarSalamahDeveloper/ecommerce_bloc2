import 'package:ecommerce_bloc/features/shop/cart/screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/color/color_manager.dart';
import '../profile/screen/profile_screen.dart';
import '../setting/screen/setting.dart';
import '../shop/favorite/screen/favorit_screen.dart';
import '../shop/home/screen/home_screen.dart';
import 'bloc/navgation_bottom_bar_bloc.dart';
import 'component/custom_button.dart';

class HomeScreenBottomNav extends StatelessWidget {
  HomeScreenBottomNav({Key? key}) : super(key: key);
  List<Widget> listPage = [
    HomePage(),
    FavoriteScreen(),
    ProfilePage(),
    Setting()
  ];
  List bottomappbar = [
    {"title": "home", "icon": Icons.home},
    {"title": "favorite", "icon": Icons.favorite},
    {"title": "profile", "icon": Icons.person},
    {"title": "settings", "icon": Icons.settings}
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavgationBottomBarBloc, NavgationBottomBarState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
                backgroundColor: AppColor.primaryColor,
                onPressed: () {
                  // Get.toNamed(AppRoute.cart);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Cart()));
                },
                child: const Icon(Icons.shopping_basket_outlined)),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(
                shape: const CircularNotchedRectangle(),
                notchMargin: 10,
                child: Row(
                  children: [
                    ...List.generate(listPage.length + 1, ((index) {
                      int i = index > 2 ? index - 1 : index;
                      return index == 2
                          ? const Spacer()
                          : CustomButtonAppBar(
                              textbutton: bottomappbar[i]['title'],
                              icondata: bottomappbar[i]['icon'],
                              onPressed: () {
                                BlocProvider.of<NavgationBottomBarBloc>(context)
                                    .add(BotNavigate(i));
                              },
                              active: state.currentpage == i ? true : false);
                    }))
                  ],
                )),
            body: listPage.elementAt(state.currentpage),
          );
        });
  }
}
