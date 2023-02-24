import 'package:flutter/material.dart';

// text
class CustomTextGilroy_Bold extends StatelessWidget {
  const CustomTextGilroy_Bold({super.key, required this.text, this.size});
  final String? text;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: TextStyle(
          fontWeight: FontWeight.bold, fontFamily: "Gilroy", fontSize: size),
    );
  }
}

class CustomTextGilroy extends StatelessWidget {
  const CustomTextGilroy({super.key, required this.text, this.size});
  final String? text;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: TextStyle(fontFamily: "Gilroy", fontSize: size),
    );
  }
}

// text h2
class CustomTextGilroy_Medium extends StatelessWidget {
  const CustomTextGilroy_Medium({super.key, required this.text});
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Gilroy"),
    );
  }
}

// text bt

