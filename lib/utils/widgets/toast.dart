import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// error toast dialog
showErrorToast(String label) {
  Fluttertoast.showToast(
    msg: label,
    backgroundColor: Colors.red,
    gravity: ToastGravity.CENTER,
  );
}

// success toast dialog
showToast(String label) {
  Fluttertoast.showToast(
    msg: label,
    backgroundColor: Colors.green,
    gravity: ToastGravity.CENTER,
  );
}
