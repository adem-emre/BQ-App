import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthBottomButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  const AuthBottomButton({
    Key? key, required this.label, required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(label,
              style: GoogleFonts.inconsolata(
                  fontSize: 16,
                  fontWeight: FontWeight.bold),),);
  }
}