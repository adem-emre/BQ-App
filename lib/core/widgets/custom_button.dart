import 'package:bq_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final Color? buttonColor;
  final String label;
  final void Function() onPressed;
  const CustomButton(
      {Key? key,
      required this.label,
      required this.onPressed,
      this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        elevation: 6,
        primary: buttonColor ?? AppColors.defaultButtonColor,
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style:
            GoogleFonts.inconsolata(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
