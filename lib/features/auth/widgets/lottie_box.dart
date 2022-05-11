

import 'package:bq_app/core/extensions/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class LottieBox extends StatelessWidget {
  final String lottiePath;
  final bool repeat;
  const LottieBox({ Key? key, required this.lottiePath, this.repeat=true }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      
      lottiePath,
      width: context.setScaledWidth(0.42),
      height: context.setScaledWidth(0.42),
      repeat: repeat,
    );
  }
}