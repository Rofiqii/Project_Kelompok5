import 'package:flutter_application_1/data/api/api_client.dart';
import 'package:flutter_application_1/utils/app_constants.dart';
import 'package:get/get.dart';
class OrderRepo{
  final ApiClient apiCliet;
  OrderRepo({required this.apiCliet});

Future<Response> placeOrder()async{
    return await apiCliet.getData(AppConstants.PLACE_ORDER_URI);
  }
}