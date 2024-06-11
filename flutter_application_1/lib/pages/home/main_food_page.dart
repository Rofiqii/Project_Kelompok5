import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/controllers/auth_controller.dart';
import 'package:flutter_application_1/controllers/popular_product_controller.dart';
import 'package:flutter_application_1/controllers/recommended_product_controller.dart';
import 'package:flutter_application_1/controllers/user_controller.dart';
import 'package:flutter_application_1/pages/home/food_page_body.dart';
import 'package:flutter_application_1/pages/home/home_page.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:flutter_application_1/widgets/display_name.dart';
import 'package:flutter_application_1/widgets/small_text.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

Future<void> _loadResource() async {
  await Get.find<PopularProductController>().getPopularProductList();
  await Get.find<RecommendedProductController>().getRecommendedProductList();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    print("current height is " + MediaQuery.of(context).size.height.toString());
    return RefreshIndicator(
        child: Column(
          children: [
            //showing the header
            GetBuilder<UserController>(
              builder: (userController) { 
                return Container(
                  child: Container(
                    margin: EdgeInsets.only(
                        top: Dimensions.height45, bottom: Dimensions.height15),
                    padding: EdgeInsets.only(
                        left: Dimensions.width20, right: Dimensions.width20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            BigText(
                                text: "Indonesia", color: AppColors.mainColor),
                            Row(
                              children: [
                                DisplayName(
                                  // text: "tes",
                                  text: '',
                                  // Receiving object name from widget display_name
                                  color: Colors.black54,
                                ),
                                Icon(
                                  Icons.arrow_drop_down_circle_rounded,
                                  size: Dimensions.iconSize16,
                                )
                              ],
                            )
                          ],
                        ),
                        Center(
                          child: Container(
                            width: Dimensions.height45,
                            height: Dimensions.height45,
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                              size: Dimensions.iconSize24,
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius15),
                              color: AppColors.mainColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            //showing the body
            Expanded(
              child: SingleChildScrollView(
                child: FoodPageBody(),
              ),
            ),
          ],
        ),
        onRefresh: _loadResource);
  }
}
