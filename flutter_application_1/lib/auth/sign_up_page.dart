import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/auth/sign_in_page.dart';
import 'package:flutter_application_1/base/custom_loader.dart';
import 'package:flutter_application_1/base/show_custom_snackbar.dart';
import 'package:flutter_application_1/controllers/auth_controller.dart';
import 'package:flutter_application_1/models/signup_body_model.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/app_text_field.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signUpImages = ["t.png", "f.png", "g.png"];

    void _registration(AuthController authController) {
      // var authController = Get.find<AuthController>();
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (name.isEmpty) {
        showCustomSnackBar("Kolom nama tidak boleh kosong", title: "Nama");
      } else if (phone.isEmpty) {
        showCustomSnackBar("Kolom nomor telepon tidak boleh kosong",
            title: "Nomor Telepon");
      } else if (email.isEmpty) {
        showCustomSnackBar("Kolom email tidak boleh kosong",
            title: "Alamat Email");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Ketik email yang valid",
            title: "Email tidak valid");
      } else if (password.isEmpty) {
        showCustomSnackBar("Kolom password tidak boleh kosong",
            title: "Password");
      } else if (password.length < 6) {
        showCustomSnackBar("Password tidak boleh kurang dari 6 huruf",
            title: "Password terlalu pendek");
      } else {
        // showCustomSnackBar("Pendaftaran berhasil", title: "Berhasil");
        SignUpBody signUpBody = SignUpBody(
            name: name, phone: phone, email: email, password: password);
        //calling method from repo for post method,
        //then goin to api as response to repo,
        //then if its true you get response update from auth controller.
        authController.registration(signUpBody).then((status) {
          if (status.isSuccess) {
            print("Registrasi berhasil");
            print(status.message + "succe");
          } else {
            showCustomSnackBar(status.message);
            print(status.message + "fail");
          }
          //9:20:23
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (_authController) {
        return !_authController.isLoading
            ? SingleChildScrollView(
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
                          backgroundImage:
                              AssetImage("assets/image/logo_part_1.png"),
                        ),
                      ),
                    ),
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
                      icon: Icons.password,
                      isObscure: true,
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    //name
                    AppTextField(
                        textController: nameController,
                        hintText: "Nama",
                        icon: Icons.person_4),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    // ur phone
                    AppTextField(
                        textController: phoneController,
                        hintText: "Nomor Telepon",
                        icon: Icons.phone),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    //sign up button
                    GestureDetector(
                      onTap: () {
                        _registration(_authController);
                      },
                      child: Container(
                        width: Dimensions.screenWidth / 2,
                        height: Dimensions.screenWidth / 9,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius30),
                            color: AppColors.mainColor),
                        child: Center(
                          child: BigText(
                            text: "Daftar",
                            size: Dimensions.font16 + Dimensions.font20 / 2,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    //tag line
                    RichText(
                        text: TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.to(() => const SignInPage(),
                                  transition: Transition.fade),
                            text: "Sudah memiliki akun?",
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: Dimensions.font20))),
                    SizedBox(
                      height: Dimensions.screenHeight * 0.05,
                    ),
                    //sign up options
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.back(),
                            text:
                                "Masuk dengan menggunakan beberapa metode dibawah",
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: Dimensions.font16))),
                    Wrap(
                      children: List.generate(
                          3,
                          (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: Dimensions.radius30,
                                  backgroundImage: AssetImage(
                                      "assets/image/" + signUpImages[index]),
                                ),
                              )),
                    )
                  ],
                ),
              )
            : const CustomLoader();
      }),
    );
  }
}
//9:01:34
