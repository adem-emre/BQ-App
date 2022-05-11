import 'package:bq_app/core/constant/app_assets.dart';
import 'package:bq_app/core/extensions/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constant/app_strings.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_form.dart';
import '../widgets/auth_bottom_button.dart';
import '../widgets/auth_header.dart';
import '../widgets/lottie_box.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: context.height,
          child: Column(
            children: [
              const AuthHeader(),
              const LottieBox(lottiePath: AppAssets.fishLottie),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: CustomTextForm(hintText: AppStrings.mailStr),
              ),
              SizedBox(
                height: 12,
              ),
              CustomButton(label: AppStrings.resetPasswordStr, onPressed: () {
                Navigator.pop(context);
              }),
               const Spacer(),
              AuthBottomButton(label: AppStrings.backToLoginStr, onPressed: (){
                Navigator.pop(context);
              })
            ],
          ),
        ),
      ),
    );
  }
}
