import 'package:flutter/material.dart';
import 'package:nuntium_news_app/utils/style/color_constant.dart';

Center textField(
    {String? label,
    TextEditingController? fieldController,
    Widget? iconSuffix,
    Widget? iconLabel,
    required bool isHidden,
    String? Function(String?)? validator}) {
  return Center(
    child: Container(
      height: 56.31,
      width: 336.84,
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        obscureText: isHidden,
        cursorColor: greyPrimary,
        controller: fieldController,
        validator: validator,
        style: TextStyle(color: greyPrimary, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: greyLighter,
          filled: true,
          focusColor: greyLighter,
          prefixIcon: iconLabel,
          suffixIcon: iconSuffix,
          labelText: label,
          labelStyle: const TextStyle(fontWeight: FontWeight.w400),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: purplePrimary),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: greyLighter),
          ),
          errorBorder: OutlineInputBorder(
            gapPadding: 2,
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: purplePrimary),
          ),
        ),
      ),
    ),
  );
}

// Icon(Icons.lock, color: greyPrimary)