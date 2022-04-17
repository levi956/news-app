import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<T?> pushTo<T>(BuildContext context, Widget page,
    [PushStyle? pushStyle]) async {
  return await Navigator.push<T>(
      context,
      pushStyle == PushStyle.cupertino
          ? CupertinoPageRoute(builder: (context) => page)
          : MaterialPageRoute(builder: (context) => page));
}

Future<T> pushReplacementTo<T>(BuildContext context, Widget page,
    [PushStyle? pushStyle]) async {
  return await Navigator.pushReplacement(
      context,
      pushStyle == PushStyle.cupertino
          ? CupertinoPageRoute(builder: (context) => page)
          : MaterialPageRoute(builder: (context) => page));
}

void pushToAndClearStack(BuildContext context, Widget page) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page), (route) => false);
}

void pop<T>(BuildContext context, [T? value]) {
  return Navigator.pop<T>(context, value);
}

enum PushStyle { material, cupertino }
