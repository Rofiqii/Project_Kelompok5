import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/sign_up_page.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/app_text_field.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.screenHeight * 0.05,
            ),
            //app logo
            Container(
              height: Dimensions.screenHeight * 0.25,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 80,
                  backgroundImage: AssetImage("assets/image/logo_part_1.png"),
                ),
              ),
            ),
            //welcome
            Container(
              margin: EdgeInsets.only(left: Dimensions.width20),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start ,
                children: [
                  Text(
                    "Hello",
                    style: TextStyle(
                        fontSize: Dimensions.font20 * 3 + Dimensions.font20 / 2,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Masuk kedalam akun",
                    style: TextStyle(
                        fontSize: Dimensions.font20 * 3 + Dimensions.font20 / 2,
                        //fontWeight: FontWeight.bold),
                        color: Colors.grey[500]),
                  ),
                ],
              ),
            ),
            SizedBox(height: Dimensions.height20,),
            //email
            AppTextField(
                textController: emailController,
                hintText: "Email",
                icon: Icons.email_rounded),
            SizedBox(
              height: Dimensions.height20,
            ),
            //pass
            AppTextField(
                textController: passwordController,
                hintText: "Kata Sandi",
                icon: Icons.password),
            SizedBox(
              height: Dimensions.height20,
            ),
            //tag line
            Row(
              children: [
                Expanded(child: Container()),
                RichText(
                    text: TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.back(),
                        text: "Login ke akun anda",
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: Dimensions.font20))),
                SizedBox(width: Dimensions.width20,)
              ],
            ),
            SizedBox(
              height: Dimensions.screenHeight * 0.05,
            ),
            //signin
            Container(
              width: Dimensions.screenWidth / 2,
              height: Dimensions.screenWidth / 13,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: AppColors.mainColor),
              child: Center(
                child: BigText(
                  text: "Masuk",
                  size: Dimensions.font20 + Dimensions.font20 / 2,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.screenHeight * 0.05,
            ),
            //sign up options
            RichText(
              text: TextSpan(
                text: "Tidak memiliki akun?",
                style: TextStyle(
                    color: Colors.grey[500], fontSize: Dimensions.font20),
                children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()..onTap=() => Get.to(SignUpPage(), transition: Transition.fade),                        
                      text: "Buat akun",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainBlackColor,
                          fontSize: Dimensions.font20)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
