import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nuntium_news_app/pages/sign_in.dart';
import 'package:nuntium_news_app/pages/wrapper.dart';
import 'package:nuntium_news_app/provider/dark_theme_provider.dart';
import 'package:nuntium_news_app/utils/style/color_constant.dart';
import 'package:nuntium_news_app/utils/style/custom_icons_icons.dart';
import 'package:nuntium_news_app/utils/widgets/buttons.dart';
import 'package:nuntium_news_app/utils/widgets/progress_indicator.dart';
import 'package:nuntium_news_app/utils/widgets/textfield.dart';
import 'package:provider/provider.dart';

import '../services/authentication/authentication.dart';
import '../utils/navigation/navigation.dart';
import '../utils/style/status_bar_color.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignInState();
}

class _SignInState extends State<SignUp> {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? get user => auth.currentUser;
  bool _isVisible = true;

  void _togglePasswordView() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  static final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _repeatPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //

    // (utils)
    // provider bool value for theme preference
    final _themeChange = Provider.of<DarkThemeProvider>(context);
    _themeChange.darkTheme
        ? setStatusBarColor(color: BarColor.white)
        : setStatusBarColor(color: BarColor.black);

    // bottom padding
    var bottom = MediaQuery.of(context).viewInsets.bottom;
    bottom = max(min(bottom, 100), 0);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.only(top: 70, bottom: bottom),
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to Nuntium 👋',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColorDark,
                      fontSize: 24),
                ),
                const SizedBox(height: 10),
                Text(
                  'Hello, I guess you are new around here. You\ncan start using the application after sign up.',
                  style: TextStyle(
                      height: 1.5,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).primaryColorLight,
                      fontSize: 16),
                ),
                const SizedBox(height: 30),
                textField(
                  label: 'Username',
                  context: context,
                  isHidden: false,
                  fieldController: _username,
                  iconLabel: Icon(
                    CustomIcons.profile,
                    color: Theme.of(context).primaryColorLight,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                textField(
                  label: 'Email Address',
                  context: context,
                  isHidden: false,
                  fieldController: _email,
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
                textField(
                  label: 'Password',
                  context: context,
                  fieldController: _password,
                  iconSuffix: InkWell(
                    onTap: _togglePasswordView,
                    child: Icon(
                      _isVisible ? Icons.visibility : Icons.visibility_off,
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ),
                  isHidden: _isVisible,
                  iconLabel: Icon(
                    Icons.lock,
                    color: Theme.of(context).primaryColorLight,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                textField(
                  label: 'Repeat Password',
                  context: context,
                  fieldController: _repeatPassword,
                  isHidden: _isVisible,
                  iconSuffix: InkWell(
                    onTap: _togglePasswordView,
                    child: Icon(
                      _isVisible ? Icons.visibility : Icons.visibility_off,
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ),
                  iconLabel: Icon(
                    Icons.lock,
                    color: Theme.of(context).primaryColorLight,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    String paassword = _password.text;
                    if (paassword != _repeatPassword.text) {
                      return 'Paasswords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Center(
                  child: PurpleButton(
                      text: 'Sign Up',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _signUp();
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
                      'Already have an account?',
                      style: TextStyle(
                          color: _themeChange.darkTheme
                              ? backgroundWhite
                              : blackLighter,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                    TextButton(
                      onPressed: () {
                        pushReplacementTo(context, const SignIn());
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            color: Theme.of(context).primaryColorLight,
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

  _signUp() async {
    showLoader(context);
    await Auth().signUp(
      _email.text.trim(),
      _password.text.trim(),
      _username.text.trim(),
    );
    pop(context);
    if (user != null) {
      pushToAndClearStack(context, const Wrapper());
    }
  }
}
