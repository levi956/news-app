import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nuntium_news_app/services/authentication/authentication_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nuntium',
      home: AuthState(),
    );
  }
}
// - getting errors becuase of no headers