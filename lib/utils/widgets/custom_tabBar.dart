import 'package:flutter/material.dart';

import '../../provider/dark_theme_provider.dart';
import '../style/color_constant.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    Key? key,
    required TabController tabController,
    required this.currentIndex,
    required DarkThemeProvider themeChange,
  })  : _tabController = tabController,
        _themeChange = themeChange,
        super(key: key);

  final TabController _tabController;
  final int currentIndex;
  final DarkThemeProvider _themeChange;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      overlayColor: MaterialStateProperty.all(transparent),
      padding: EdgeInsets.zero,
      isScrollable: true,
      labelPadding: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 5),
      controller: _tabController,
      labelColor: backgroundWhite,
      unselectedLabelColor: Theme.of(context).primaryColorLight,
      indicatorColor: Colors.transparent,
      tabs: [
        // tabs
        Tab(
          child: Container(
            margin: const EdgeInsets.only(right: 15),
            width: 81,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: currentIndex == 0
                  ? purplePrimary
                  : _themeChange.darkTheme
                      ? blackLighter
                      : greyLighter,
            ),
            child: const Center(
              child: Text(
                'General',
                style: TextStyle(
                    fontSize: 12,
                    // color: Colors.orangeAccent,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
        Tab(
          height: 32,
          child: Container(
            margin: const EdgeInsets.only(right: 15),
            width: 81,
            height: 32.84,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: currentIndex == 1
                  ? purplePrimary
                  : _themeChange.darkTheme
                      ? blackLighter
                      : greyLighter,
            ),
            child: const Center(
              child: Text(
                'Sports',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
        Tab(
          height: 32,
          child: Container(
            margin: const EdgeInsets.only(right: 15),
            width: 81,
            height: 32.84,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: currentIndex == 2
                  ? purplePrimary
                  : _themeChange.darkTheme
                      ? blackLighter
                      : greyLighter,
            ),
            child: const Center(
              child: Text(
                'Technology',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
        Tab(
          height: 32,
          child: Container(
            width: 81,
            height: 32.84,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: currentIndex == 3
                  ? purplePrimary
                  : _themeChange.darkTheme
                      ? blackLighter
                      : greyLighter,
            ),
            child: const Center(
              child: Text(
                'Business',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        )
      ],
    );
  }
}
