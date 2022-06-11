import 'package:flutter/material.dart';
// import 'package:http/http.dart';
import 'package:nuntium_news_app/pages/auth/sign_in.dart';
import 'package:nuntium_news_app/services/network/check_connectivity.dart';
import 'package:nuntium_news_app/utils/navigation/navigation.dart';
import 'package:nuntium_news_app/utils/style/color_constant.dart';
import 'package:provider/provider.dart';

import '../../provider/dark_theme_provider.dart';
import '../../services/network/fetch_data_exception.dart';
import '../../utils/style/status_bar_color.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  initState() {
    // print(checkConnectivity());
    super.initState();
  }

  // test here to see how the FetchDataException class handles
  // Future<dynamic> _getF() {
  //   throw FetchDataException(message: "Here ");
  // }

  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final _themeChange = Provider.of<DarkThemeProvider>(context);

    _themeChange.darkTheme
        ? setStatusBarColor(color: BarColor.white)
        : setStatusBarColor(color: BarColor.black);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 2,
          ),
          const Image(
            width: double.maxFinite,
            height: 272,
            image: AssetImage('assets/images/onboard.png'),
          ),

          const Spacer(),
          //
          Text(
            'Nuntium',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).primaryColorDark,
                fontSize: 25),
          ),

          //
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 60, top: 10),
            child: Text(
              'All the news in one place, be the first know the latest news',
              textAlign: TextAlign.center,
              style: TextStyle(
                  height: 1.5,
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).primaryColorLight,
                  fontSize: 16),
            ),
          ),

          //

          Container(
            margin: const EdgeInsets.only(bottom: 40, top: 50),
            child: MaterialButton(
              elevation: 4,
              minWidth: 336.84,
              onPressed: () {
                setState(() {
                  _isLoading = true;
                });

                Future.delayed(
                  const Duration(seconds: 2),
                  () {
                    setState(() {
                      _isLoading = false;
                    });
                    // push to page

                    pushToAndClearStack(context, const SignIn());
                  },
                );
              },
              color: purplePrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 30),
              child: _isLoading
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        backgroundColor: backgroundWhite,
                        color: purplePrimary,
                        strokeWidth: 2,
                      ),
                    )
                  : Text(
                      "Get Started",
                      style: TextStyle(
                          color: backgroundWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
            ),
          ),

          // exception test -- not actual part of code

          // FutureBuilder(
          //   future: _getF(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return const Text('hello');
          //     }

          //     return const Text('error');
          //     // return const Text('hello');
          //   },
          // )
        ],
      ),
    );
  }
}
