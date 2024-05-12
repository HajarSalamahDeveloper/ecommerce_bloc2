import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/app_constants/app_constanse.dart';
import '../../../core/assests_manager/assets_manger.dart';
import '../../../core/color/color_manager.dart';
import '../../../core/string_manager.dart';
import '../../../core/style_manager/style_manger.dart';
import '../../../route_mangment/AppRoute.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  _goNext() {
    print("object");
    Navigator.pushReplacementNamed(context, AppRoute.homeScreenNav);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(50),
            child: Center(
              child: Image.asset(
                ImageAssets.splashLogo,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              StringManager.nameApp,
              style: getHeadLineStyle(color: AppColor.black),
            ),
          )
        ],
      ),
    );
  }
}
