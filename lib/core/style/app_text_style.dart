import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/app_colors.dart';

class AppTextStyle{
  static final bookNameStyle =  GoogleFonts.inter(
                    fontSize: 18, fontWeight: FontWeight.w500);
  static final authorStyle =GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.authorTextColor);

  static final quoteStyle = GoogleFonts.indieFlower(
                    fontSize: 16,
                  );
}