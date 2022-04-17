import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuntium_news_app/pages/change_password_page.dart';
import 'package:nuntium_news_app/utils/navigation/navigation.dart';
import 'package:nuntium_news_app/utils/style/custom_icons_icons.dart';
import 'package:nuntium_news_app/utils/widgets/user_settings_listtile.dart';

import '../utils/style/color_constant.dart';
import '../utils/style/status_bar_color.dart';

class UserSettings extends StatefulWidget {
  const UserSettings({Key? key}) : super(key: key);

  @override
  State<UserSettings> createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  // notification alert dialog
  bool _isActive = false;
  @override
  Widget build(BuildContext context) {
    setStatusBarColor(color: BarColor.black);
    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: blackPrimary,
                  fontSize: 24),
            ),
            const SizedBox(height: 30),
            Text(
              'Eren Turkman',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: blackPrimary,
                  fontSize: 17),
            ),
            Text(
              'erenturkman@gmail.com',
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: greyPrimary,
                  fontSize: 14),
            ),
            const SizedBox(height: 30),
            SettingListTile(
              label: 'Notifications',
              trailing: Switch.adaptive(
                activeColor: purplePrimary,
                value: _isActive,
                onChanged: (value) {
                  HapticFeedback.mediumImpact();
                  setState(() {
                    _isActive = value;
                  });
                },
              ),
            ),
            SettingListTile(
              label: 'Change Password',
              trailing: IconButton(
                iconSize: 15,
                color: greyDarker,
                onPressed: () {
                  pushTo(context, const ChanagePassword());
                },
                icon: const Icon(CustomIcons2.forward),
              ),
            ),
            SettingListTile(
              label: 'Privacy',
              trailing: IconButton(
                iconSize: 15,
                color: greyDarker,
                onPressed: () {},
                icon: const Icon(CustomIcons2.forward),
              ),
            ),
            SettingListTile(
              label: 'Terms & Conditions',
              trailing: IconButton(
                iconSize: 15,
                color: greyDarker,
                onPressed: () {},
                icon: const Icon(CustomIcons2.forward),
              ),
            ),
            SettingListTile(
              label: 'Sign Out',
              trailing: IconButton(
                iconSize: 18,
                color: greyDarker,
                onPressed: () {},
                icon: const Icon(CustomIcons2.signout),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
