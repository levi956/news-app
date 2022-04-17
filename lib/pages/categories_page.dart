import 'package:flutter/material.dart';
import '../utils/style/color_constant.dart';
import '../utils/style/status_bar_color.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(color: BarColor.black);
    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: Container(
        color: backgroundWhite,
        width: double.maxFinite,
        margin: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Categories',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: blackPrimary,
                  fontSize: 24),
            ),
            const SizedBox(height: 10),
            Text(
              'Thousands of Articles in each category',
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: greyPrimary,
                  fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
