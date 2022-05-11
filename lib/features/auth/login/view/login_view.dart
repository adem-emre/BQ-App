import 'package:bq_app/core/constant/app_assets.dart';
import 'package:bq_app/core/constant/app_dimensions.dart';
import 'package:bq_app/core/constant/app_strings.dart';
import 'package:bq_app/core/extensions/context_ext.dart';
import 'package:bq_app/core/widgets/custom_button.dart';
import 'package:bq_app/core/widgets/custom_text_form.dart';
import 'package:bq_app/features/auth/register/register_view.dart';
import 'package:bq_app/features/auth/reset_password/reset_password_view.dart';
import 'package:bq_app/features/auth/widgets/auth_bottom_button.dart';
import 'package:bq_app/features/auth/widgets/lottie_box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../widgets/auth_header.dart';
import '../../widgets/password_text_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: context.height,
          child: Column(
            children: [
              const AuthHeader(),
              const LottieBox(lottiePath: AppAssets.booksLottie),
              Text(
                AppStrings.welcomeStr,
                style: GoogleFonts.inconsolata(
                    fontWeight: FontWeight.bold, fontSize: 27),
              ),
              Padding(
                padding: AppDimensions.pagePadding,
                child: Column(
                  children: [
                    CustomTextForm(hintText: AppStrings.mailStr),
                    const PasswordTextForm(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ResetPasswordView()));
                        },
                        child: Text(
                          AppStrings.forgotPasswordStr,
                          style: GoogleFonts.inconsolata(
                              fontSize: 16,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    CustomButton(label: AppStrings.loginStr, onPressed: () {})
                  ],
                ),
              ),
              const Spacer(),
              AuthBottomButton(
                  label: AppStrings.noAccountStr,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterView()));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
