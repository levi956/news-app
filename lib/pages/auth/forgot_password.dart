import 'package:flutter/material.dart';
import 'package:nuntium_news_app/utils/navigation/navigation.dart';
import 'package:nuntium_news_app/utils/widgets/bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../provider/dark_theme_provider.dart';
import '../../services/authentication/authentication.dart';
import '../../utils/style/color_constant.dart';
import '../../utils/style/status_bar_color.dart';
import '../../utils/widgets/buttons.dart';
import '../../utils/widgets/progress_indicator.dart';
import '../../utils/widgets/textfield.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  static final _formKey = GlobalKey<FormState>();

  final String emailSent =
      'An email reset link has been sent, please check your email.';

  final _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //

    // (utils)
    // provider bool value for theme preference
    final _themeChange = Provider.of<DarkThemeProvider>(context);
    _themeChange.darkTheme
        ? setStatusBarColor(color: BarColor.white)
        : setStatusBarColor(color: BarColor.black);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Forgot Password 🤔',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColorDark,
                      fontSize: 24),
                ),
                const SizedBox(height: 10),
                Text(
                  'We need your email address so we can send\nyou the password reset code',
                  style: TextStyle(
                      height: 1.5,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).primaryColorLight,
                      fontSize: 16),
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  isHidden: false,
                  label: 'Email Address',
                  controller: _email,
                  iconLabel: Icon(
                    Icons.email,
                    color: Theme.of(context).primaryColorLight,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address';
                    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                Center(
                  child: PurpleButton(
                      text: 'Submit',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _forgetpassword();
                        }
                      },
                      buttonColor: purplePrimary),
                ),
                const SizedBox(height: 15),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Remeber the password?',
                      style: TextStyle(
                          color: _themeChange.darkTheme
                              ? backgroundWhite
                              : blackLighter,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () => pop(context),
                      child: Text(
                        'Try again',
                        style: TextStyle(
                            color: Theme.of(context).primaryColorDark,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _forgetpassword() async {
    showLoader(context);
    await Auth().forgotPassword(_email.text.trim());
    pop(context);
    await showResponseBottomSheet(context, emailSent);
    pop(context);

    // show a dialog with message of success or error
  }
}
