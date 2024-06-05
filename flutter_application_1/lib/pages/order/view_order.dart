import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/controllers/order_controller.dart';
import 'package:flutter_application_1/models/order_model.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:get/get.dart';

class ViewOrder extends StatelessWidget {
  final bool isCurrent;
  const ViewOrder({super.key, required this.isCurrent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<OrderController>(builder: (orderController) {
        if (orderController.isLoading == false) {
          late List<OrderModel> orderList;
          print("object failing");
          if (orderController.currentOrderList.isNotEmpty) {
            orderList = isCurrent
                ? orderController.currentOrderList.reversed.toList()
                : orderController.historyOrderList.reversed.toList();
          }
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
                                  Text("#order ID       " +
                                      orderList[index].id.toString()),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: AppColors.mainColor,
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.radius20 / 4)),
                                        child: Container(
                                          margin: EdgeInsets.all(
                                              Dimensions.height10 / 2),
                                          child: Text(
                                            '${orderList[index].orderStatus}',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: Dimensions.height10 / 2,
                                      ),
                                      InkWell(
                                        onTap: () => null,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.radius20 / 4),
                                            border: Border.all(
                                                width: 1,
                                                color: Theme.of(context)
                                                    .primaryColor),
                                          ),
                                          child: Container(
                                              margin: EdgeInsets.all(
                                                  Dimensions.height10 / 2),
                                              child: Text("Track order")),
                                        ),
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
        } else {
          return Text("loading");
        }
      }),
    );
  }
}
