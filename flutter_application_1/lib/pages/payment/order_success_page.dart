import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/route_helper.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:get/get.dart';

class OrderSuccessPage extends StatelessWidget {
  final String orderID;
  final int status;
  OrderSuccessPage({required this.orderID, required this.status});

  @override
  Widget build(BuildContext context) {
    if (status == 0) {
      Future.delayed(Duration(seconds: 1), () {
        //
      });
    }
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: Dimensions.screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                status == 1
                    ? Icons.check_circle_outline
                    : Icons.warning_amber_outlined,
                size: 100,
                color: AppColors.mainColor,
              ),
              // Image.asset(
              //     status == 1
              //         ? "assets/image/checked.png"
              //         : "assets/image/warning.png",
              //     width: 100,
              //     height: 100),
              SizedBox(height: Dimensions.height30),

              Text(
                status == 1
                    ? 'Kamu berhasil melakukan pemesanan makanan'
                    : 'Pesananmu gagal',
                style: TextStyle(fontSize: Dimensions.font26),
              ),
              SizedBox(height: Dimensions.height10),

              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.height10,
                    vertical: Dimensions.height10),
                child: Text(
                  status == 1 ? 'Pemesanan berhasil' : 'Pemesanan gagal',
                  style: TextStyle(
                      fontSize: Dimensions.font20,
                      color: Theme.of(context).disabledColor),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: Dimensions.height10,
              ),

              Padding(
                padding: EdgeInsets.all(Dimensions.height10),
                child: TextButton(
                  style: TextButton.styleFrom(
                    textStyle: TextStyle(
                      height: 1.2,
                      fontFamily: 'Dubai',
                      fontSize: 13,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: () => Get.offAllNamed(RouteHelper.getInitial()),
                  child: const Text('Kembali ke halaman utama'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
