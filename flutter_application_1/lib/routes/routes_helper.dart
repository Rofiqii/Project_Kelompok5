import 'package:flutter_application_1/pages/home/main_food_page.dart';
import 'package:flutter_application_1/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String splashPage = "/splash-page";

  static String getSplashPage() => '$splashPage';
  static String getInitial() => '$initial';

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(name: initial, page: () => MainFoodPage()),
    
  ];
  //7:52:39o0
}
