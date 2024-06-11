import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/sign_in_page.dart';
import 'package:flutter_application_1/auth/sign_up_page.dart';
import 'package:flutter_application_1/controllers/cart_controller.dart';
import 'package:flutter_application_1/controllers/popular_product_controller.dart';
import 'package:flutter_application_1/controllers/recommended_product_controller.dart';
import 'package:flutter_application_1/pages/food/popular_food_detail.dart';
import 'package:flutter_application_1/pages/food/recommended_food_detail.dart';
import 'package:flutter_application_1/pages/home/food_page_body.dart';
import 'package:flutter_application_1/pages/home/main_food_page.dart';
import 'package:flutter_application_1/pages/splash/splash_page.dart';
import 'package:flutter_application_1/routes/route_helper.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Get.find<RecommendedProductController>().getRecommendedProductList();
    // Get.find<PopularProductController>().getPopularProductList();
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(builder: (_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          // theme: ThemeData(primarySwatch: Colors.blue
          //     // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          //     // useMaterial3: true,
          //     ),
          // home: SignInPage(),
          initialRoute: RouteHelper.getSplashPage(),
          getPages: RouteHelper.routes,
          theme: ThemeData(
            primaryColor: AppColors.mainColor,
            fontFamily: "Lato",
          ),
        );
      });
    });
  }
}
