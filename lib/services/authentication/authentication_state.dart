import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../pages/onboarding.dart';
import '../../pages/wrapper.dart';

class AuthState extends StatelessWidget {
  const AuthState({Key? key}) : super(key: key);

  // stream that listens to user state (sign in or out)
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const Wrapper();
        }
        return const Onboarding();
      },
    );
  }
}
