import 'package:flutter_application_1/data/repository/order_repo.dart';
import 'package:flutter_application_1/models/order_model.dart';
import 'package:flutter_application_1/models/place_order_model.dart';
import 'package:get/get.dart';

class OrderController extends GetxController implements GetxService {
  OrderRepo orderRepo;
  OrderController({required this.orderRepo});
  bool _isLoading = false;
  late List<OrderModel> _currentOrderList;
  late List<OrderModel> _historyOrderList;

  bool get isLoading => _isLoading;
  List<OrderModel> get currentOrderList => _currentOrderList;
  List<OrderModel> get runningOrderList => _historyOrderList;

  int _paymentIndex = 0;
  int get paymentIndex => _paymentIndex;

  String _orderType = "delivery";
  String get orderType => _orderType;

  String _foodNote = " ";
  String get foodNote => _foodNote;
  Future<void> placeOrder(PlaceOrderBody placeOrder, Function callback) async {
    _isLoading = true;
    Response response = await orderRepo.placeOrder(placeOrder);
    if (response.statusCode == 200) {
      _isLoading = false;
      String message = response.body["message"];
      String orderID = response.body["order_id"].toString();
      callback(true, message, orderID);
    } else {
      callback(false, response.statusText!, '-1');
    }
  }

  Future<void> getOrderList() async {
    _isLoading = true;
    Response response = await orderRepo.getOrderList();
    if (response.statusCode == 200) {
      _historyOrderList = [];
      _currentOrderList = [];
      response.body.forEach((order) {
        OrderModel orderModel = OrderModel.fromJson(order);
        if (orderModel.orderStatus == 'pending' ||
            orderModel.orderStatus == 'accepted' ||
            orderModel.orderStatus == 'processing' ||
            orderModel.orderStatus == 'handover' ||
            orderModel.orderStatus == 'accepted' ||
            orderModel.orderStatus == 'picked_up') {
          _currentOrderList.add(orderModel);
        } else {
          _historyOrderList.add(orderModel);
        }
      });
    } else {
      _historyOrderList = [];
      _currentOrderList = [];
    }
    _isLoading = false;
    update();
  }

  void setPaymentIndex(int index) {
    _paymentIndex = index;
    update();
  }

  void setDeliveryType(String type) {
    _orderType = type;
    update();
  }

  void setFoodNote(String note) {
    _foodNote = note;
    // update(); causing double update error in cart page because two nested controller
  }
}