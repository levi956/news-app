import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// error toast dialog
void showErrorToast(String label) {
  Fluttertoast.showToast(
    msg: label,
    backgroundColor: Colors.red,
    gravity: ToastGravity.SNACKBAR,
  );
}

// success toast dialog
showToast(String label) {
  Fluttertoast.showToast(
    msg: label,
    backgroundColor: Colors.green,
    gravity: ToastGravity.SNACKBAR,
  );
}
