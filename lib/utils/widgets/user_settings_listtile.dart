import 'package:flutter/material.dart';
import 'package:nuntium_news_app/utils/style/color_constant.dart';
import 'package:provider/provider.dart';

import '../../provider/dark_theme_provider.dart';

class SettingListTile extends StatelessWidget {
  final String? label;
  final Widget? trailing;
  const SettingListTile({Key? key, this.trailing, this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // provider bool value for theme preference
    final _themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        tileColor: _themeChange.darkTheme ? blackLighter : greyLighter,
        title: Text(
          label!,
          style: TextStyle(
              color: _themeChange.darkTheme ? backgroundWhite : blackLighter,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        trailing: trailing,
      ),
    );
  }
}
