import 'package:bq_app/features/auth/widgets/lottie_box.dart';
import 'package:bq_app/features/auth/widgets/password_text_form.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_assets.dart';
import '../../../../core/constant/app_dimensions.dart';
import '../../../../core/constant/app_strings.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form.dart';
import '../../widgets/auth_bottom_button.dart';
import '../../widgets/auth_header.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const AuthHeader(),
                  const LottieBox(
                    lottiePath: AppAssets.registerLottie,
                    repeat: false,
                  ),
                  Padding(
                    padding: AppDimensions.pagePadding,
                    child: Column(
                      children: [
                        const CustomTextForm(hintText: AppStrings.nameStr),
                        const CustomTextForm(hintText: AppStrings.surnameStr),
                        const CustomTextForm(hintText: AppStrings.mailStr),
                        const PasswordTextForm(),
                        const SizedBox(
                          height: 12,
                        ),
                        CustomButton(
                            label: AppStrings.registerStr,
                            onPressed: () {
                              Navigator.pop(context);
                            })
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          AuthBottomButton(
              label: AppStrings.alreadyHaveAccountStr,
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
