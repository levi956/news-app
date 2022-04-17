import 'package:flutter/material.dart';

import '../utils/style/color_constant.dart';
import '../utils/style/status_bar_color.dart';

class BookMarks extends StatelessWidget {
  const BookMarks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(color: BarColor.black);
    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: Container(
        color: backgroundWhite,
        width: double.maxFinite,
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bookmarks',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: blackPrimary,
                  fontSize: 24),
            ),
            const SizedBox(height: 10),
            Text(
              'Saved Articles to the library',
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: greyPrimary,
                  fontSize: 16),
            ),
            const SizedBox(height: 200),
            Center(
              child: CircleAvatar(
                child: const Image(
                  width: 16,
                  height: 20,
                  image: AssetImage('assets/images/noBookmark.png'),
                ),
                radius: 33,
                backgroundColor: greyishPurple,
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                'You haven\'t saved any article yet.Start reading and bookmarking them now',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: blackPrimary,
                    fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
