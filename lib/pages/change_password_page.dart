import 'package:flutter/material.dart';
import 'package:nuntium_news_app/utils/navigation/navigation.dart';
import 'package:nuntium_news_app/utils/style/color_constant.dart';
import 'package:nuntium_news_app/utils/widgets/buttons.dart';
import 'package:nuntium_news_app/utils/widgets/textfield.dart';

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
    setStatusBarColor(color: BarColor.black);
    return Scaffold(
      backgroundColor: backgroundWhite,
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
                  color: greyDarker,
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
                      color: blackPrimary,
                      fontSize: 24),
                ),
              ],
            ),
            textField(
              label: 'Current Password',
              isHidden: false,
              fieldController: _currentPassword,
              iconLabel: Icon(Icons.lock, color: greyPrimary),
            ),
            textField(
              label: 'New Password',
              isHidden: false,
              fieldController: _newPassword,
              iconLabel: Icon(Icons.lock, color: greyPrimary),
            ),
            textField(
              label: 'Repeat New Password',
              isHidden: false,
              fieldController: _confirmNewPassword,
              iconLabel: Icon(Icons.lock, color: greyPrimary),
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
