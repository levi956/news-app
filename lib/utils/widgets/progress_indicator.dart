import 'package:flutter/material.dart';

void showLoader(BuildContext context) {
  showDialog(
    // barrierDismissible: false,
    context: context,
    builder: (context) => const Center(
      child: CircularProgressIndicator.adaptive(),
    ),
  );
}
