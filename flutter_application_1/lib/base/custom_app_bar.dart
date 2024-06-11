import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/widgets/big_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool backButtonExist;
  final Function? onBackPressed;

  const CustomAppBar(
      {super.key,
      required this.title,
      this.backButtonExist = true,
      this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: BigText(
        text: title,
        color: Colors.white,
      ),
      centerTitle: true,
    backgroundColor: AppColors.mainColor,
      elevation: 0,
      leading: backButtonExist
          ? IconButton(
              onPressed: () => onBackPressed != null
                  ? onBackPressed!()
                  : Navigator.pushReplacementNamed(context, "/initial"),
              icon: Icon(Icons.arrow_back_ios_new_rounded))
          : SizedBox(),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(500, 53);
}
