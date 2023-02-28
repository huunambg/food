import 'package:flutter/material.dart';
import 'package:foob_ok/widgets/custom_text.dart';

AppBar CusstomAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    toolbarHeight: 100,
    elevation: 0,
    backgroundColor: Colors.transparent,
    foregroundColor: Colors.black,
    centerTitle: true,
    title: Column(
      children: [
        Image.asset(
          "assets/carrot.png",
          height: 30,
          width: 30,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.place),
            CustomTextGilroy_Bold(
              text: "Dhaka, Banassre",
            )
          ],
        )
      ],
    ),
  );
}
