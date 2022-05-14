

import 'package:flutter/material.dart';

class QuoteBackButton extends StatelessWidget {
  const QuoteBackButton({
    Key? key, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 24,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(8)),
          child: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: (){
            Navigator.pop(context);
          },
        ));
  }
}
