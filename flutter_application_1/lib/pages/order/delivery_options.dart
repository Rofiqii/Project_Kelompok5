import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/dimensions.dart';

class DeliveryOptions extends StatelessWidget {
  final String value;
  final String title;
  final String amount;
  final String isFree;
  const DeliveryOptions(
      {super.key,
      required this.value,
      required this.title,
      required this.amount,
      required this.isFree});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: "delivery",
          activeColor: Theme.of(context).primaryColor,
          onChanged: (value) {
            print(value.toString());
          },
        ),
        SizedBox(width: Dimensions.width10/2,),
        Text(title,),
        SizedBox(width: Dimensions.width10/2,),
        Text(
          ""
          // '(${(value== 'take away'||isFree)?'free':'\$${amount/10}'})'
        )
      ],
    );
  }
}
