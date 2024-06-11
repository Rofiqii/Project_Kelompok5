import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/custom_loader.dart';
import 'package:flutter_application_1/base/no_data_page.dart';
import 'package:flutter_application_1/controllers/order_controller.dart';
import 'package:flutter_application_1/models/order_model.dart';
import 'package:flutter_application_1/routes/styles.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:get/get.dart';

class ViewOrder extends StatelessWidget {
  final bool isCurrent;
  final bool isNotAvailable;
  const ViewOrder(
      {super.key, required this.isCurrent, required this.isNotAvailable});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<OrderController>(builder: (orderController) {
        if (isNotAvailable == false) {
          if (orderController.isLoading == false) {
            late List<OrderModel> orderList = [];

            if (isCurrent) {
              orderList = orderController.currentOrderList.reversed.toList();
            } else {
              orderList = orderController.historyOrderList.reversed.toList();
            }

            if (orderList.isEmpty) {
              return Center(
                child: const NoDataPage(
                  text: "Kamu belum pernah membeli !",
                  imgPath: "assets/image/empty_box.png",
                ),
              );
            } else {
              return SizedBox(
                width: Dimensions.screenWidth,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width10 / 2,
                      vertical: Dimensions.height10 / 2),
                  child: ListView.builder(
                      itemCount: orderList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () => null,
                            child: Column(
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "#order ID",
                                            style: robotoRegular.copyWith(
                                                fontSize: Dimensions.font12),
                                          ),
                                          SizedBox(
                                            width: Dimensions.width10 / 2,
                                          ),
                                          Text(
                                              '#${orderList[index].id.toString()}'),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: AppColors.mainColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions.radius20 /
                                                            4)),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: Dimensions.width10,
                                                vertical:
                                                    Dimensions.width10 / 2),
                                            child: Text(
                                                '${orderList[index].orderStatus}',
                                                style: robotoMedium.copyWith(
                                                    fontSize:
                                                        Dimensions.font12,
                                                    color: Theme.of(context)
                                                        .cardColor)),
                                          ),
                                          SizedBox(
                                            height: Dimensions.height10 / 2,
                                          ),
                                          InkWell(
                                            onTap: () => null,
                                            child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        Dimensions.width10,
                                                    vertical:
                                                        Dimensions.width10 /
                                                            2),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          Dimensions.radius20 /
                                                              4),
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Theme.of(context)
                                                          .primaryColor),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      "assets/image/tracking.png",
                                                      height: 15,
                                                      width: 15,
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                    ),
                                                    SizedBox(
                                                      width: Dimensions.width10 /
                                                          2,
                                                    ),
                                                    Text("track order",
                                                        style: robotoMedium.copyWith(
                                                            fontSize: Dimensions
                                                                .font12,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor)),
                                                  ],
                                                )),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: Dimensions.height10,
                                )
                              ],
                            ));
                      }),
                ),
              );
            }
          } else {
            return const CustomLoader();
          }
        } else {
          return SizedBox(
              height: MediaQuery.of(context).size.height / 1.5,
              child: Center(
                child: const NoDataPage(
                  text: "Kamu belum pernah membeli !",
                  imgPath: "assets/image/empty_box.png",
                ),
              ));
        }
      }),
    );
  }
}
