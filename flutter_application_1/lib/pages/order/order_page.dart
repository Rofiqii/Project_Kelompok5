import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/custom_app_bar.dart';
import 'package:flutter_application_1/base/no_data_page.dart';
import 'package:flutter_application_1/controllers/auth_controller.dart';
import 'package:flutter_application_1/controllers/order_controller.dart';
import 'package:flutter_application_1/pages/order/view_order.dart';
import 'package:flutter_application_1/routes/route_helper.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:get/get.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin {
  TabController? _tabController;
  late bool _isLoggedIn;
  late bool _isNotAvailable;

  @override
  void initState() {
    super.initState();
    _isLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_isLoggedIn) {
      _tabController = TabController(length: 2, vsync: this);
      Get.find<OrderController>().getOrderList();
    }

    _isNotAvailable = Get.find<OrderController>().getOrderList() == null || !_isLoggedIn;
    print(_isNotAvailable);
    print("isNotAvailable return");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Pesanan saya",
      ),
      body: _isLoggedIn
          ? _tabController != null
              ? Column(
                  children: [
                    Container(
                      width: Dimensions.screenWidth,
                      child: TabBar(
                        indicatorColor: Theme.of(context).primaryColor,
                        indicatorWeight: 3,
                        labelColor: Theme.of(context).primaryColor,
                        unselectedLabelColor: AppColors.yellowColor,
                        controller: _tabController!,
                        tabs: const [
                          Tab(
                            text: "Sekarang",
                          ),
                          Tab(
                            text: "Riwayat ",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController!,
                        children: [
                          ViewOrder(
                            isCurrent: true,
                            isNotAvailable: _isNotAvailable,
                          ),
                          ViewOrder(
                            isCurrent: false,
                            isNotAvailable: _isNotAvailable,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Center(child: CircularProgressIndicator())
          : Container(
                child: Center(
                    child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.maxFinite,
                    height: Dimensions.height20 * 8,
                    margin: EdgeInsets.only(
                        left: Dimensions.width20, right: Dimensions.width20),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        image: DecorationImage(
                            // fit: BoxFit.cover,
                            image: AssetImage(
                                "assets/image/emptyorder.png"))),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getSignInPage());
                    },
                    child: Container(
                      width: double.maxFinite,
                      height: Dimensions.height20 * 4,
                      margin: EdgeInsets.only(
                          left: Dimensions.width20, right: Dimensions.width20),
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                      ),
                      child: Center(
                          child: BigText(
                        text: "Masuk",
                        color: Colors.white,
                        size: Dimensions.font20,
                      )),
                    ),
                  )
                ],
              )))
    );
  }
}
