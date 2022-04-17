import 'package:flutter/material.dart';
import 'package:nuntium_news_app/pages/onboarding.dart';
import 'package:nuntium_news_app/pages/wrapper.dart';

void main() {
  runApp(const MyApp());
}

// to do
// - create content for remaining tab bars

// - logic for sign in & sign up (validate & hidden)
// - include firebase in both platfroms apps
// - write stream for auth changes
// - write methods for login and sign up
// - write method for forget password by email
// - write method for setter for username from the "user" object
// - think about loading indicator

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nuntium',
      home: Onboarding(),
    );
  }
}
