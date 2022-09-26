import 'package:flutter/material.dart';

import '../../../../../size_config.dart';

class OtherCard extends StatelessWidget {
  OtherCard({super.key, required this.icon, required this.press, required this.heading});
  
  final IconData icon;
  final Function() press;
  final String heading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(20),
              shadowColor: Colors.black.withOpacity(0.4),
              child:Container(
                padding: EdgeInsets.symmetric(vertical: getScreenWidth(20)),
                width: double.infinity,
                decoration: BoxDecoration(
                  color:Colors.grey[100],
                  borderRadius:BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration:  BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Icon(icon, color: Colors.white),
                      ),
                      const SizedBox(width: 20),
                      Text(heading, style: const TextStyle(fontFamily: 'Nunito-Medium', fontSize: 17))

                    ],
                ),
                ),
              ) ,
            ),
    );
  }
}