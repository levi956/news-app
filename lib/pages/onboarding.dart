import 'package:flutter/material.dart';
import 'package:nuntium_news_app/pages/sign_in.dart';
import 'package:nuntium_news_app/utils/navigation/navigation.dart';
import 'package:nuntium_news_app/utils/style/color_constant.dart';

import '../utils/style/status_bar_color.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    setStatusBarColor(color: BarColor.black);
    return Scaffold(
      backgroundColor: backgroundWhite,
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
                fontWeight: FontWeight.w600, color: blackPrimary, fontSize: 25),
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
                  color: greyPrimary,
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
        ],
      ),
    );
  }
}
