import 'package:flutter/services.dart';

class SetPortait {
  static init() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }
}
