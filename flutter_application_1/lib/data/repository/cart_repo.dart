import 'dart:convert';

import 'package:flutter_application_1/models/cart_model.dart';
import 'package:flutter_application_1/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});
//  convert objects to string because sharedpreferences only accepts string
  List<String> cart = [];
  void addToCartList(List<CartModel> cartList) {
    cart = [];
    //convert object to json using jsonEncode to convert object to string
    cartList.forEach((element) => cart.add(jsonEncode(element)));

    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    // print(sharedPreferences.getStringList(AppConstants.CART_LIST));
    getCartList();
  }

  List<CartModel> getCartList() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
      print("inside getCartList " + carts.toString());
    }

    List<CartModel> cartList = [];
    //if you have string or json you need to decode using jsonDecode to convert string to object
    carts.forEach((element) => CartModel.fromJson(jsonDecode(element)));

    return cartList;
  }
}
