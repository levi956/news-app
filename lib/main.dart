import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nuntium_news_app/services/authentication/authentication_state.dart';
import 'package:nuntium_news_app/utils/system/set_portrait.dart';
import 'package:provider/provider.dart';

import 'provider/dark_theme_provider.dart';
import 'utils/style/color_constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SetPortait.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => themeChangeProvider),
      child: Consumer<DarkThemeProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Style.themeData(themeChangeProvider.darkTheme, context),
            title: 'Nuntium',
            themeMode: ThemeMode.system,
            home: const AuthState(),
          );
        },
      ),
    );
  }
}

// new goal
// restructre this app following the clean architecture patttern to
// get more familiar with the architecture at centiiv



// the socket exception class for internet connectivity 
// proper structure for API call with a base helper class for all that sha 
// and throwing it into the UI