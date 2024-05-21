// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/auth_controller.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:get/get.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin {
  late TabController _tabController;
  late bool _isLoggedIn;

  @override
  void initState() {
    super.initState();
    _isLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_isLoggedIn) {
      _tabController = TabController(length: 2, vsync: this);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pesanan Saya",
        ),
        backgroundColor: AppColors.mainColor,
      ),
      body: Column(
        children: [
          Container(
            width: Dimensions.screenWidth,
            child: TabBar(
              indicatorColor: Theme.of(context).primaryColor,
              indicatorWeight: 3,
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: AppColors.yellowColor,
              controller: _tabController,
              tabs: [
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
                  controller: _tabController,
                  children: [
                    Text("order1"), Text("order2")]))
        ],
      ),
    );
  }
}
