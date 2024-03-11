import 'package:flutter_application_1/controllers/popular_product_controller.dart';
import 'package:flutter_application_1/data/api/api_client.dart';
import 'package:flutter_application_1/data/repository/auth_repo.dart';
import 'package:flutter_application_1/data/repository/popular_product_repo.dart';
import 'package:flutter_application_1/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()))

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  // Get.lazyPut(() => Recommended)

  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}