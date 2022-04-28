import 'package:flutter/material.dart';

import '../../../core/constant/app_colors.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(double.infinity, 110) ,
      painter: AuthHeaderPainter(),
      
    );
  }
}

class AuthHeaderPainter extends CustomPainter{
  

  @override
  void paint(Canvas canvas, Size size) {
    var headerPainter = Paint()
    ..color=AppColors.authHeaderColor
    ..style=PaintingStyle.fill;

    Path headerPath = Path();
    headerPath.moveTo(0, 0);
    headerPath.lineTo(0, size.height);
    headerPath.quadraticBezierTo((size.width*0.1), size.height-90, size.width, size.height);
    headerPath.lineTo(size.width, 0);
    headerPath.lineTo(0, 0);
    headerPath.close();

    canvas.drawPath(headerPath, headerPainter);
    
  }


  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw false;
  }

}

