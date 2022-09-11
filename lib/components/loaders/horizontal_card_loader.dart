import 'package:flutter/material.dart';

import '../skelton_card.dart';

class HorizontalCardLoader extends StatelessWidget {
  const HorizontalCardLoader({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SkeltonCard(height: 140),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SkeltonCard(width: 200, height: 13),
                      const SizedBox(width: 10),
                      SkeltonCard(width: 40, height: 13),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SkeltonCard(width: 150, height: 13),
                  const SizedBox(height: 10),
                  SkeltonCard(width: 100, height: 13),
                ],
              ),
                );
  }
}