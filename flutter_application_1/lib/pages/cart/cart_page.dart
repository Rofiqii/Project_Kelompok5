import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/base/common_text_button.dart';
import 'package:flutter_application_1/base/no_data_page.dart';
import 'package:flutter_application_1/base/show_custom_snackbar.dart';
import 'package:flutter_application_1/controllers/auth_controller.dart';
import 'package:flutter_application_1/controllers/cart_controller.dart';
import 'package:flutter_application_1/controllers/order_controller.dart';
import 'package:flutter_application_1/controllers/popular_product_controller.dart';
import 'package:flutter_application_1/controllers/recommended_product_controller.dart';
import 'package:flutter_application_1/controllers/user_controller.dart';
import 'package:flutter_application_1/models/place_order_model.dart';
import 'package:flutter_application_1/pages/home/main_food_page.dart';
import 'package:flutter_application_1/pages/order/delivery_options.dart';
import 'package:flutter_application_1/routes/route_helper.dart';
import 'package:flutter_application_1/utils/app_constants.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/app_icon.dart';
import 'package:flutter_application_1/widgets/app_text_field.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:flutter_application_1/pages/order/payment_option_button.dart';
import 'package:flutter_application_1/widgets/small_text.dart';
import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _noteController = TextEditingController();
    return Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: Dimensions.height20 * 3,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // SizedBox(
                  //   width: Dimensions.width20 * 5,
                  // ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(
                      icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart_rounded,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ],
              ),
            ),
            GetBuilder<CartController>(builder: (_cartController) {
              return _cartController.getItems.length > 0
                  ? Positioned(
                      top: Dimensions.height20 * 5,
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      bottom: 0,
                      child: Container(
                        margin: EdgeInsets.only(top: Dimensions.height15),
                        // color: Colors.red,
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: GetBuilder<CartController>(
                              builder: (cartController) {
                            // _ meant for private variable
                            var _cartList = cartController.getItems;
                            return ListView.builder(
                                itemCount: _cartList.length,
                                itemBuilder: (_, index) {
                                  return Container(
                                    height: Dimensions.height20 * 5,
                                    width: double.maxFinite,
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            var popularIndex = Get.find<
                                                    PopularProductController>()
                                                .popularProductList
                                                .indexOf(
                                                    _cartList[index].product!);
                                            if (popularIndex >= 0) {
                                              Get.toNamed(
                                                  RouteHelper.getPopularFood(
                                                      popularIndex,
                                                      "cartpage"));
                                            } else {
                                              var recommendedIndex = Get.find<
                                                      RecommendedProductController>()
                                                  .recommendedProductList
                                                  .indexOf(_cartList[index]
                                                      .product!);
                                              if (recommendedIndex < 0) {
                                                Get.snackbar(
                                                  "Riwayat pembelian",
                                                  "Review produk tidak tersedia untuk riwayat produk",
                                                  backgroundColor:
                                                      AppColors.mainColor,
                                                  colorText: Colors.white,
                                                );
                                              } else {
                                                Get.toNamed(RouteHelper
                                                    .getRecommendedFood(
                                                        recommendedIndex,
                                                        "cartpage"));
                                              }
                                            }
                                          },
                                          child: Container(
                                            width: Dimensions.height20 * 5,
                                            height: Dimensions.height20 * 5,
                                            margin: EdgeInsets.only(
                                                bottom: Dimensions.height10),
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        AppConstants.BASE_URL +
                                                            AppConstants
                                                                .UPLOAD_URL +
                                                            cartController
                                                                .getItems[index]
                                                                .img!)),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions.radius20),
                                                color: Colors.white),
                                          ),
                                        ),
                                        SizedBox(
                                          width: Dimensions.width10,
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: Dimensions.height20 * 5,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                BigText(
                                                  text: cartController
                                                      .getItems[index].name!,
                                                  color: Colors.black54,
                                                ),
                                                SmallText(text: "Spicy"),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    BigText(
                                                      text: cartController
                                                          .getItems[index].price
                                                          .toString(),
                                                      color: Colors.redAccent,
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: Dimensions
                                                              .height10,
                                                          bottom: Dimensions
                                                              .height10,
                                                          left: Dimensions
                                                              .height10,
                                                          right: Dimensions
                                                              .height10),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  Dimensions
                                                                      .radius20),
                                                          color: Colors.white),
                                                      child: Row(
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              //function that makes product disappear if it has 0 quantity
                                                              cartController.addItem(
                                                                  _cartList[
                                                                          index]
                                                                      .product!,
                                                                  -1);
                                                            },
                                                            child: Icon(
                                                              Icons.remove,
                                                              color: AppColors
                                                                  .signColor,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: Dimensions
                                                                    .width10 /
                                                                2,
                                                          ),
                                                          BigText(
                                                              text: _cartList[
                                                                      index]
                                                                  .quantity
                                                                  .toString()), //popularProduct.inCartItems.toString()),
                                                          SizedBox(
                                                            width: Dimensions
                                                                    .width10 /
                                                                2,
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              cartController.addItem(
                                                                  _cartList[
                                                                          index]
                                                                      .product!,
                                                                  1);
                                                              // popularProduct.setQuantity(true);
                                                            },
                                                            child: Icon(
                                                              Icons.add,
                                                              color: AppColors
                                                                  .signColor,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          }),
                        ),
                      ),
                    )
                  : NoDataPage(text: "Keranjangmu kosong!");
              //
            })
          ],
        ),
        bottomNavigationBar: GetBuilder<OrderController>(
          builder: (orderController) {
            _noteController.text = orderController.foodNote;
            return GetBuilder<CartController>(builder: (cartController) {
              return Container(
                  height: Dimensions.bottomHeightBar + 50,
                  padding: EdgeInsets.only(
                      top: Dimensions.height10,
                      bottom: Dimensions.height10,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                    color: AppColors.buttonBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius20 * 2),
                      topLeft: Radius.circular(Dimensions.radius20 * 2),
                    ),
                  ),
                  child: cartController.getItems.length > 0
                      ? Column(
                          children: [
                            InkWell(
                              onTap: () => showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (_) {
                                  return Column(
                                    children: [
                                      Expanded(
                                        child: SingleChildScrollView(
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.9,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(
                                                    Dimensions.radius20),
                                                topLeft: Radius.circular(
                                                    Dimensions.radius20),
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 520,
                                                  padding: EdgeInsets.only(
                                                      left: Dimensions.width20,
                                                      right: Dimensions.width20,
                                                      top: Dimensions.height20),
                                                  child: Column(
                                                    children: [
                                                      const PaymentOptionButton(
                                                          index: 0,
                                                          icon: Icons.money,
                                                          title:
                                                              "Bayar di kasir",
                                                          subTitle:
                                                              "Langsung membayar dengan mendatangi kasir"),
                                                      SizedBox(
                                                        height:
                                                            Dimensions.height10,
                                                      ),
                                                      // const PaymentOptionButton(
                                                      //     index: 1,
                                                      //     icon: Icons
                                                      //         .paypal_sharp,
                                                      //     title:
                                                      //         "Pembayaran digital",
                                                      //     subTitle:
                                                      //         "Pembayaran dengan lebih mudah dan cepat"),
                                                      SizedBox(
                                                        height:
                                                            Dimensions.height20,
                                                      ),
                                                      // DeliveryOptions(
                                                      //     value: "take away",
                                                      //     title:
                                                      //         "Bayar ke kasir",
                                                      //     amount: 10000,
                                                      //     isFree: false),

                                                      SizedBox(
                                                        height:
                                                            Dimensions.height20,
                                                      ),
                                                      // DeliveryOptions(value: "delivery", title: "Pengiriman Makanan", amount: double.parse(Get.find<CartController>().totalAmount.toString()), isFree: false),
                                                      Text(
                                                        "Info Tambahan",
                                                        // style: Dimensions.font16,
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            Dimensions.height20,
                                                      ),
                                                      AppTextField(
                                                        textController:
                                                            _noteController,
                                                        hintText: 'ketik disini',
                                                        icon: Icons.note,
                                                        maxLines: true,
                                                      ),

                                                      // DeliveryOptions(value: value, title: title, amount: amount, isFree: isFree)
                                                    ],
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ).whenComplete(() => orderController
                                  .setFoodNote(_noteController.text.trim())),
                              child: SizedBox(
                                width: double.maxFinite,
                                child: CommonTextButton(
                                  text: "Opsi Pembayaran",
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      top: Dimensions.height20,
                                      bottom: Dimensions.height20,
                                      left: Dimensions.height20,
                                      right: Dimensions.height20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius20),
                                      color: Colors.white),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: Dimensions.width10 / 2,
                                      ),
                                      BigText(
                                          text: "\Rp. " +
                                              cartController.totalAmount
                                                  .toString()),
                                      SizedBox(
                                        width: Dimensions.width10 / 2,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: Dimensions.width10 * 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // popularProduct.addItem(product);
                                    if (Get.find<AuthController>()
                                        .userLoggedIn()) {
                                      // cartController.addToHistory();
                                      print("logged in");
                                      var cart =
                                          Get.find<CartController>().getItems;
                                      var user =
                                          Get.find<UserController>().userModel;
                                      PlaceOrderBody placeOrder =
                                          PlaceOrderBody(
                                              cart: cart,
                                              orderAmount: 100.0,
                                              orderNote:
                                                  orderController.foodNote,
                                              // contactPersonName: user!.name,
                                              // contactPersonNumber: user!.phone,
                                              orderType:
                                                  orderController.orderType,
                                              paymentMethod: orderController
                                                          .paymentIndex ==
                                                      0
                                                  ? 'cash_on_delivery'
                                                  : 'digital_payment');
                                      // print("Opsi pmbyrn " +
                                      //     placeOrder.toJson()['payment_method']);
                                      // return;
                                      Get.find<OrderController>()
                                          .placeOrder(placeOrder, _callback);
                                      return;
                                    } else {
                                      Get.toNamed(RouteHelper.getSignInPage());
                                    }
                                  },
                                  child: CommonTextButton(
                                    text: "Check out",
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      : Container());
            });
          },
        ));
  }

  void _callback(bool isSuccess, String message, String orderID) {
    if (isSuccess) {
      Get.find<CartController>().clear(); //to nullify the items
      Get.find<CartController>()
          .removeCartSharedPreference(); //then removing items from the sharedpreference
      Get.find<CartController>().addToHistory();
      if (Get.find<OrderController>().paymentIndex == 0) {
        Get.offNamed(RouteHelper.getOrderSuccessPage(orderID, "success"));
      } else {
        Get.offNamed(RouteHelper.getPaymentPage(
            orderID, Get.find<UserController>().userModel!.id));
      }
    } else {
      showCustomSnackBar(message);
    }
  }
}
