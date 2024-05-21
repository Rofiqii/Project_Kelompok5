import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/big_text.dart';

class CommonTextButton extends StatelessWidget {
  final String text;
  const CommonTextButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: Dimensions.height20,
          bottom: Dimensions.height20,
          left: Dimensions.width10,
          right: Dimensions.width10),
      child: Center(
        child: BigText(
          text: text,
          color: Colors.white,
        ),
      ),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 10,
                color: AppColors.mainColor.withOpacity(0.3))
          ],
          borderRadius: BorderRadius.circular(Dimensions.radius20),
          color: AppColors.mainColor),
    );
  }
}
