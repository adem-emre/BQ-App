

import 'package:flutter/material.dart';

class BookSlideButton extends StatelessWidget {
  final Color buttonColor;
  final void Function() onPressed;
  final Icon icon;
  const BookSlideButton({
    Key? key, required this.onPressed, required this.icon, required this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: ElevatedButton(
           style: ElevatedButton.styleFrom(
             shape:const CircleBorder(),
             padding: const EdgeInsets.all(15),
             primary: buttonColor,
           ),
            onPressed: onPressed, child: icon));
  }
}