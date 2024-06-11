import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/popular_product_controller.dart';
import 'package:flutter_application_1/controllers/recommended_product_controller.dart';
import 'package:flutter_application_1/controllers/user_controller.dart';
import 'package:flutter_application_1/data/api/api_checker.dart';
import 'package:flutter_application_1/data/repository/recommended_product_repo.dart';
import 'package:flutter_application_1/routes/route_helper.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResource() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
    await Get.find<UserController>().getUserInfo();
  }

  @override
  void initState() {
    super.initState();
    _loadResource();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   ApiChecker();
    // });
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);

    Timer(const Duration(seconds: 3),
        () => Get.offNamed(RouteHelper.getInitial()));
  }

//1:47:25
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            "assets/image/logo_jember.png",
            width: 250,
          )),
          Center(
              child: Image.asset(
            "assets/image/scuderia_ferrari.png",
            width: 250,
          ))
        ],
      ),
    );
  }
}

//1:32:10