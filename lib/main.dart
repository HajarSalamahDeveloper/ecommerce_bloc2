import 'package:ecommerce_bloc/route_mangment/app_rout_managment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRoutes(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.appRouter});
  final AppRoutes appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: appRouter.generateRoute,
          );
        });
  }
}
