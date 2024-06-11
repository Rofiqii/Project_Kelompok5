import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/base/custom_loader.dart';
import 'package:flutter_application_1/controllers/auth_controller.dart';
import 'package:flutter_application_1/controllers/user_controller.dart';
import 'package:get/get.dart';

class DisplayName extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final double height;

  DisplayName({
    Key? key,
    this.color = const Color(0xFF89dad0),
    required this.text,
    this.size = 12,
    this.height = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Get.find<AuthController>().userLoggedIn()) {
      return GetBuilder<UserController>(builder: (userController) {
        return (userController.isLoading
            ? Text(
                userController.userModel!.name,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: size,
                  color: color,
                  height: height,
                  fontWeight: FontWeight.w500,
                ),
              )
            : CustomLoader());
      });
    } else {
      return Text(
        "Login Terlebih Dahulu",
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: size,
          color: color,
          height: height,
          fontWeight: FontWeight.w500,
        ),
      );
    }
  }
}
