import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuntium_news_app/pages/bookmarks_page.dart';
import 'package:nuntium_news_app/pages/categories_page.dart';
import 'package:nuntium_news_app/pages/home_page.dart';
import 'package:nuntium_news_app/pages/user_settings.dart';
import 'package:nuntium_news_app/utils/style/custom_icons_icons.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';
import '../utils/style/color_constant.dart';
import '../utils/style/status_bar_color.dart';

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
    // provider bool value for theme preference
    final _themeChange = Provider.of<DarkThemeProvider>(context);
    _themeChange.darkTheme
        ? setStatusBarColor(color: BarColor.white)
        : setStatusBarColor(color: BarColor.black);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        selectedItemColor: purplePrimary,
        unselectedItemColor: greyPrimary,
        iconSize: 20,
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
              label: 'bookmarks'),
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
