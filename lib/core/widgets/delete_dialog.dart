import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/app_strings.dart';
import 'custom_button.dart';

class DeleteDialog extends StatelessWidget {
  final String message;
  final void Function() onDelete;
  const DeleteDialog({
    Key? key, required this.message, required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
          title:  Text(
              message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                AppStrings.cancelStr,
                style: GoogleFonts.inconsolata(
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            CustomButton(
                padding: EdgeInsets.zero,
                label: AppStrings.deleteStr,
                onPressed: onDelete)
          ],
        );
  }
}