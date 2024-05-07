import 'package:flutter_application_1/data/repository/order_rapo.dart';
import 'package:get/get.dart';

class OrderController extends GetxController implements GetxService{
  OrderRepo orderRepo;
  OrderController({required this.orderRepo});
  bool _isLoading=false;
  bool get isLoading=>_isLoading;
  Future<void> placeOrder()async{
    _isLoading=true;
    Response response = await orderRepo.placeOrder();
    if(response.statusCode==200){
      _isLoading=false;
      String string= response.body["massage"];
      String orderID= response.body["order_id"].toString();
    }
  }
}