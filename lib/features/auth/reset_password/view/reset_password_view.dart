import 'package:bq_app/core/constant/app_assets.dart';
import 'package:bq_app/utils/helper/validation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/app_dimensions.dart';
import '../../../../core/constant/app_strings.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form.dart';
import '../../widgets/auth_bottom_button.dart';
import '../../widgets/auth_header.dart';
import '../../widgets/lottie_box.dart';
import '../cubit/reset_password_cubit.dart';

class ResetPasswordView extends StatelessWidget {
  ResetPasswordView({Key? key}) : super(key: key);

  final _resetPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(),
      child: Builder(builder: (context) {
        return BlocListener<ResetPasswordCubit, ResetPasswordState>(
          listener: (context, state) {
            if (state is ResetPasswordSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  duration: AppDimensions.snackBarDuration,
                  content: Text(AppStrings.resetPasswordMailSentMsg)));
              Navigator.pop(context);
            } else if (state is ResetPasswordError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: AppDimensions.snackBarDuration,
                  content: Text(state.error)));
            }
          },
          child: Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _resetPasswordFormKey,
                      child: Column(
                        children: [
                          const AuthHeader(),
                          const LottieBox(lottiePath: AppAssets.fishLottie),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: CustomTextForm(
                              hintText: AppStrings.mailStr,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                return ValidationHelper.validateMail(value);
                              },
                              onSaved: (value) {
                                context.read<ResetPasswordCubit>().mail = value;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          CustomButton(
                              label: AppStrings.resetPasswordStr,
                              onFuture: () async {
                                if (_resetPasswordFormKey.currentState!
                                    .validate()) {
                                  _resetPasswordFormKey.currentState!.save();
                                  await context
                                      .read<ResetPasswordCubit>()
                                      .resetPassword();
                                }
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
                AuthBottomButton(
                    label: AppStrings.backToLoginStr,
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ),
          ),
        );
      }),
    );
  }
}
