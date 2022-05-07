// to acheive here is to write a fucntion that checks the status of the platform
// -- either  mobile or wifi or none

// ignore_for_file: unrelated_type_equality_checks

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

// function would be a bool which would return true if there is an internet connection

// now to fix if there is no data, just check if it can connect to maybe a web
// url in the background

Future<bool> checkConnectivity() async {
  var connectStatus = await Connectivity().checkConnectivity();

  if (connectStatus == ConnectivityResult.mobile &&
      InternetConnectionChecker().hasConnection == true) {
    print('mobile and has connection');
    // connected to mobile
    return true;
  } else if (connectStatus == ConnectivityResult.wifi &&
      InternetConnectionChecker().hasConnection == true) {
    print('wifi and has connnection');
    // connected to wifi
    return true;
  } else if (connectStatus == ConnectivityResult.none) {
    print('none connect');
    return false;
  } else {
    print('false false');
    return false;
  }
}
