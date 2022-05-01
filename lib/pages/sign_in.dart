import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nuntium_news_app/pages/forgot_password.dart';
import 'package:nuntium_news_app/pages/sign_up.dart';
import 'package:nuntium_news_app/pages/wrapper.dart';
import 'package:nuntium_news_app/utils/navigation/navigation.dart';
import 'package:nuntium_news_app/utils/style/color_constant.dart';
import 'package:nuntium_news_app/utils/widgets/buttons.dart';
import 'package:nuntium_news_app/utils/widgets/progress_indicator.dart';
import 'package:nuntium_news_app/utils/widgets/textfield.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';
import '../services/authentication/authentication.dart';
import '../utils/style/status_bar_color.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _isVisible = true;
  FirebaseAuth auth = FirebaseAuth.instance;
  User? get user => auth.currentUser;

  void _togglePasswordView() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  initState() {
    super.initState();
  }

  static final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //

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
                  'Welcome Back 👋',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColorDark,
                      fontSize: 24),
                ),
                const SizedBox(height: 10),
                Text(
                  'We are happy to see you again. You can\ncontinue where you left off by logging in',
                  style: TextStyle(
                      height: 1.5,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).primaryColorLight,
                      fontSize: 16),
                ),
                const SizedBox(height: 30),
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
                  iconSuffix: InkWell(
                    onTap: _togglePasswordView,
                    child: Icon(
                      _isVisible ? Icons.visibility : Icons.visibility_off,
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ),
                  fieldController: _password,
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
                const SizedBox(height: 30),
                Center(
                  child: PurpleButton(
                      text: 'Sign In',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _login();
                        }
                      },
                      buttonColor: purplePrimary),
                ),
                const SizedBox(height: 15),
                // Checkbox(
                //   value: _themeChange.darkTheme,
                //   onChanged: (bool? value) {
                //     _themeChange.darkTheme = value!;
                //   },
                // ),
                Row(
                  children: [
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        // gets the true or false value for theme change
                        // print(_themeChange.darkTheme);
                        pushTo(context, const ForgotPassword());
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            // color: greyPrimary,
                            color: _themeChange.darkTheme
                                ? backgroundWhite
                                : greyPrimary,
                            fontSize: 15),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                          // color: blackLighter,
                          color: _themeChange.darkTheme
                              ? backgroundWhite
                              : blackLighter,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                    TextButton(
                      onPressed: () {
                        pushReplacementTo(context, const SignUp());
                      },
                      child: Text(
                        'Sign Up',
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

  _login() async {
    showLoader(context);
    await Auth().signIn(_email.text.trim(), _password.text.trim());
    pop(context);
    if (user != null) {
      pushToAndClearStack(context, const Wrapper());
    } else {
      CherryToast.error(
        autoDismiss: true,
        title: const Text('Error'),
        description: const Text('Email/Password Incorrect'),
        animationType: ANIMATION_TYPE.fromTop,
      ).show(context);
    }
  }
}
