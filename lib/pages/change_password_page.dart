import 'package:flutter/material.dart';
import 'package:nuntium_news_app/utils/navigation/navigation.dart';
import 'package:nuntium_news_app/utils/style/color_constant.dart';
import 'package:nuntium_news_app/utils/widgets/buttons.dart';
import 'package:nuntium_news_app/utils/widgets/textfield.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';
import '../utils/style/status_bar_color.dart';

class ChanagePassword extends StatefulWidget {
  const ChanagePassword({Key? key}) : super(key: key);

  @override
  State<ChanagePassword> createState() => _ChanagePasswordState();
}

class _ChanagePasswordState extends State<ChanagePassword> {
  final _currentPassword = TextEditingController();
  final _newPassword = TextEditingController();
  final _confirmNewPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // provider bool value for theme preference
    final _themeChange = Provider.of<DarkThemeProvider>(context);
    _themeChange.darkTheme
        ? setStatusBarColor(color: BarColor.white)
        : setStatusBarColor(color: BarColor.black);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 70, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                // back button
                IconButton(
                  iconSize: 19,
                  color: Theme.of(context).primaryColorLight,
                  onPressed: () {
                    pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                const SizedBox(width: 10),
                Text(
                  'Change Password',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColorDark,
                      fontSize: 24),
                ),
              ],
            ),
            textField(
              label: 'Current Password',
              context: context,
              isHidden: false,
              fieldController: _currentPassword,
              iconLabel: Icon(
                Icons.lock,
                color: Theme.of(context).primaryColorLight,
              ),
            ),
            textField(
              label: 'New Password',
              context: context,
              isHidden: false,
              fieldController: _newPassword,
              iconLabel: Icon(
                Icons.lock,
                color: Theme.of(context).primaryColorLight,
              ),
            ),
            textField(
              label: 'Repeat New Password',
              context: context,
              isHidden: false,
              fieldController: _confirmNewPassword,
              iconLabel: Icon(
                Icons.lock,
                color: Theme.of(context).primaryColorLight,
              ),
            ),
            const SizedBox(height: 15),
            PurpleButton(
                text: 'Change Password',
                onPressed: () {},
                buttonColor: purplePrimary)
          ],
        ),
      ),
    );
  }
}
