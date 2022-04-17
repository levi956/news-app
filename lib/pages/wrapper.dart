import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuntium_news_app/pages/bookmarks_page.dart';
import 'package:nuntium_news_app/pages/categories_page.dart';
import 'package:nuntium_news_app/pages/home_page.dart';
import 'package:nuntium_news_app/pages/user_settings.dart';
import 'package:nuntium_news_app/utils/style/custom_icons_icons.dart';

import '../utils/style/color_constant.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  int _currentIndex = 0;
  static const List<Widget> _screens = [
    HomePage(),
    Categories(),
    BookMarks(),
    UserSettings()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: purplePrimary,
        unselectedItemColor: greyPrimary,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int tappedIndex) {
          setState(() {
            HapticFeedback.lightImpact();
            _currentIndex = tappedIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                CustomIcons.home,
              ),
              label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(
                CustomIcons.categories,
              ),
              label: 'search'),
          BottomNavigationBarItem(
              icon: Icon(
                CustomIcons.bookmarks,
              ),
              label: 'tickets'),
          BottomNavigationBarItem(
              icon: Icon(
                CustomIcons.profile,
              ),
              label: 'user')
        ],
      ),
      body: IndexedStack(
        children: _screens,
        index: _currentIndex,
      ),
    );
  }
}
