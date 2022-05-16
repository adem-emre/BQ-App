import 'package:bq_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatefulWidget {
  final Color? buttonColor;
  final String label;
  final EdgeInsets? padding;
  final void Function()? onPressed;
  final Future<void> Function()? onFuture;
  const CustomButton(
      {Key? key,
      required this.label,
      this.onPressed,
      this.buttonColor,
      this.padding,
      this.onFuture})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isLoading = false;

  changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.only(top: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          elevation: 6,
          primary: widget.buttonColor ?? AppColors.defaultButtonColor,
        ),
        onPressed: () async {
          if (widget.onFuture != null) {
            changeLoading();
            await widget.onFuture!.call();
            changeLoading();
          } else {
            widget.onPressed?.call();
          }
        },
        child: isLoading
            ? const SizedBox(
                height: 6,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Text(
                widget.label,
                style: GoogleFonts.inconsolata(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
