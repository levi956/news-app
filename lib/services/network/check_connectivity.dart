// to acheive here is to write a fucntion that checks the status of the platform
// -- either  mobile or wifi or none

import 'package:connectivity_plus/connectivity_plus.dart';

// function would be a bool which would return true if there is an internet connection

// now to fix if there is no data, just check if it can connect to maybe a web
// url in the background

Future<bool> checkConnectivity() async {
  var connectStatus = await (Connectivity().checkConnectivity());

  if (connectStatus == ConnectivityResult.mobile) {
    // connected to mobile
    return true;
  } else if (connectStatus == ConnectivityResult.wifi) {
    // connected to wifi
    return true;
  } else if (connectStatus == ConnectivityResult.none) {
    // print('none connect');
    return false;
  } else {
    // print('false false');
    return false;
  }
}
