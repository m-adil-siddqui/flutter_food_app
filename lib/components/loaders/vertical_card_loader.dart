import 'package:flutter/material.dart';

import '../skelton_card.dart';

class VerticalCardLoader extends StatelessWidget {
  const VerticalCardLoader({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
              width: 200,
              // margin: EdgeInsets.symmetric(horizontal: 15),
              child: 
                    Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: SkeltonCard(width: 100, height: 100, radius: 5),
                      ),
                      const SizedBox(height: 8),
                      SkeltonCard(width: 150, height: 10),
                      const SizedBox(height: 10),
                      SkeltonCard(width: 140, height: 10),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SkeltonCard(width: 40, height: 10),
                          const SizedBox(width: 6),
                          SkeltonCard(width: 100, height: 10),
                        ],
                      ),
                      const SizedBox(height: 12),
                      SkeltonCard(width: 100, height: 10),
                    ],
                ),
            );
  }
}