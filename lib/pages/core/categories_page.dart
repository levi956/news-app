import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/dark_theme_provider.dart';
import '../../utils/style/status_bar_color.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // provider bool value for theme preference
    final _themeChange = Provider.of<DarkThemeProvider>(context);
    _themeChange.darkTheme
        ? setStatusBarColor(color: BarColor.white)
        : setStatusBarColor(color: BarColor.black);
    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        width: double.maxFinite,
        margin: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Categories',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColorDark,
                  fontSize: 24),
            ),
            const SizedBox(height: 10),
            Text(
              'Thousands of Articles in each category',
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).primaryColorLight,
                  fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
