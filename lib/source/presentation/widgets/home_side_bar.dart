import 'package:flutter/material.dart';
import 'package:taima_calculator/source/colors.dart';

class HomeSideBar extends StatelessWidget {
  const HomeSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.2,
      decoration: BoxDecoration(color: deepGreen),
      child: Column(
        children: [
          Image.asset('assets/images/taima_logo.png', fit: BoxFit.fitWidth),
        ],
      ),
    );
  }
}
