import 'package:flutter/material.dart';

class PurpleButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color buttonColor;
  final Color? buttonTextColor;

  const PurpleButton(
      {required this.text,
      required this.onPressed,
      required this.buttonColor,
      this.buttonTextColor,
      Key? key})
      : super(key: key);

  final double borderRadius = 15;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 336.84,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: buttonColor),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          alignment: Alignment.center,
          padding: MaterialStateProperty.all(
            const EdgeInsets.only(top: 15, bottom: 15),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: buttonTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
