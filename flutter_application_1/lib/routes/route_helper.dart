import 'package:flutter_application_1/auth/sign_in_page.dart';
import 'package:flutter_application_1/auth/sign_up_page.dart';
import 'package:flutter_application_1/models/order_model.dart';
import 'package:flutter_application_1/pages/cart/cart_history.dart';
import 'package:flutter_application_1/pages/cart/cart_page.dart';
import 'package:flutter_application_1/pages/food/popular_food_detail.dart';
import 'package:flutter_application_1/pages/food/recommended_food_detail.dart';
import 'package:flutter_application_1/pages/home/home_page.dart';
import 'package:flutter_application_1/pages/home/main_food_page.dart';
import 'package:flutter_application_1/pages/payment/order_success_page.dart';
import 'package:flutter_application_1/pages/payment/payment_page.dart';
import 'package:flutter_application_1/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String splashPage = "/splash-page";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String signIn = "/sign-in";
  static const String cartPage = "/cart-page";
  static const String cartHistoryPage = "/cart-history-page";
  static const String payment = '/payment';
  static const String orderSuccess = '/order-successful';

  static String getSplashPage() => '$splashPage';
  static String getInitial() => '$initial';
  static String getPopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';
  static String getCartHistoryPage() => '$cartHistoryPage';
  static String getSignInPage() => '$signIn';
  static String getPaymentPage(String id, int userID) =>
      '$payment?id=$id&userID=$userID';
  static String getOrderSuccessPage(String orderID, String status) =>
      '$orderSuccess?id=$orderID&status=$status';

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(
        name: initial,
        page: () {
          //return signuppage for register
          return HomePage();
        }),
    GetPage(
        name: signIn,
        page: () {
          return SignInPage();
        },
        transition: Transition.fade),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters["page"];
          return PopularFoodDetail(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters["page"];
          return RecommendedFoodDetail(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: cartPage,
        page: () {
          return CartPage();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: cartHistoryPage,
        page: () {
          return CartHistory();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: payment,
        page: () => PaymentPage(
            orderModel: OrderModel(
                id: int.parse(Get.parameters['id']!),
                userId: int.parse(Get.parameters["userID"]!)
                // these two is required in orderModel
                ))),
    GetPage(
        name: orderSuccess,
        page: () => OrderSuccessPage(
              orderID: Get.parameters['id']!,
              status: Get.parameters["status"].toString().contains("success")
                  ? 1
                  : 0,
            ))
  ];
}
