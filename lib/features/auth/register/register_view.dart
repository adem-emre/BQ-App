import 'package:bq_app/core/extensions/context_ext.dart';
import 'package:bq_app/features/auth/widgets/lottie_box.dart';
import 'package:bq_app/features/auth/widgets/password_text_form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constant/app_assets.dart';
import '../../../core/constant/app_dimensions.dart';
import '../../../core/constant/app_strings.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_form.dart';
import '../widgets/auth_bottom_button.dart';
import '../widgets/auth_header.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: SizedBox(
          height: context.height,
          child: Column(
            children: [
              const AuthHeader(),
              const LottieBox(lottiePath: AppAssets.registerLottie,repeat: false,),
              
              Padding(
                                padding: AppDimensions.pagePadding,

                child: Column(
                  children: [
                    CustomTextForm(hintText: AppStrings.nameStr),
                    CustomTextForm(hintText: AppStrings.surnameStr),
                    CustomTextForm(hintText: AppStrings.mailStr),
                    const PasswordTextForm(),
                    SizedBox(height: 12,),
                    CustomButton(label: AppStrings.registerStr, onPressed: (){
                Navigator.pop(context);

                    })
                  ],
                ),
              ),
              const Spacer(),
              AuthBottomButton(label: AppStrings.alreadyHaveAccountStr, onPressed: (){
                Navigator.pop(context);
              })
            ],
          ),
        ),
      ),
      
    );
  }
}