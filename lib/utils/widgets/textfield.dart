import 'package:flutter/material.dart';
import 'package:nuntium_news_app/utils/style/color_constant.dart';
import 'package:provider/provider.dart';

import '../../provider/dark_theme_provider.dart';

Center textField(
    {String? label,
    TextEditingController? fieldController,
    Widget? iconSuffix,
    Widget? iconLabel,
    required bool isHidden,
    BuildContext? context,
    String? Function(String?)? validator}) {
  final _themeChange = Provider.of<DarkThemeProvider>(context!);
  return Center(
    child: Container(
      height: 56.31,
      width: 336.84,
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        autocorrect: false,
        obscureText: isHidden,
        cursorColor: greyPrimary,
        controller: fieldController,
        validator: validator,
        style: const TextStyle(fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: _themeChange.darkTheme ? greyPrimary : greyLighter,
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

class CustomTextField extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final Widget? iconSuffix;
  final Widget? iconLabel;
  final bool isHidden;
  final String? Function(String?)? validator;

  const CustomTextField(
      {Key? key,
      this.controller,
      this.iconLabel,
      this.iconSuffix,
      required this.isHidden,
      this.label,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeChange = Provider.of<DarkThemeProvider>(context);
    return Center(
      child: SizedBox(
        height: 56.31,
        width: 336.84,
        child: TextFormField(
          autocorrect: false,
          obscureText: isHidden,
          cursorColor: greyPrimary,
          controller: controller,
          validator: validator,
          style: const TextStyle(fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            fillColor: _themeChange.darkTheme ? greyPrimary : greyLighter,
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
}
