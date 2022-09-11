import 'package:flutter/material.dart';
import '../size_config.dart';


class SocialCard extends StatelessWidget {
  const SocialCard({ Key? key, required this.press, required this.icon }) : super(key: key);
  final Function() press;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: getScreenWidth(10)),
        padding: EdgeInsets.all(getScreenWidth(12)),
        height: getScreenHeight(40),
        width: getScreenWidth(40),
        decoration: const BoxDecoration(
          color: Color(0xFFF5F6F9),
          shape: BoxShape.circle
        ),
        child: icon,
     ),
    );
  }
}

