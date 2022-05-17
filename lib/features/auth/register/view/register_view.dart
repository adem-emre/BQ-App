import 'package:bq_app/features/auth/register/cubit/register_cubit.dart';
import 'package:bq_app/features/auth/widgets/lottie_box.dart';
import 'package:bq_app/features/auth/widgets/password_text_form.dart';
import 'package:bq_app/utils/helper/validation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/app_assets.dart';
import '../../../../core/constant/app_dimensions.dart';
import '../../../../core/constant/app_strings.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form.dart';
import '../../widgets/auth_bottom_button.dart';
import '../../widgets/auth_header.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);
  final _registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: BlocListener<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state is RegisterSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    duration: AppDimensions.snackBarDuration,
                    content: Text(AppStrings.registerSuccessMsg)));
                Navigator.pop(context);
              } else if (state is RegisterError) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: AppDimensions.snackBarDuration,
                  content: Text(state.message),
                ));
              }
            },
            child: Column(
              children: [_registerForm(context), _backToLoginButton(context)],
            ),
          ),
        );
      }),
    );
  }

  Expanded _registerForm(BuildContext context) {
    return Expanded(
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
              child: Form(
                key: _registerFormKey,
                child: Column(
                  children: [
                    CustomTextForm(
                      hintText: AppStrings.nameStr,
                      validator: (name) {
                        return ValidationHelper.isNotNullOrEmpty(name);
                      },
                      onSaved: (value) {
                        context.read<RegisterCubit>().name = value;
                      },
                    ),
                    CustomTextForm(
                      hintText: AppStrings.surnameStr,
                      validator: (surName) {
                        return ValidationHelper.isNotNullOrEmpty(surName);
                      },
                      onSaved: (value) {
                        context.read<RegisterCubit>().surName = value;
                      },
                    ),
                    CustomTextForm(
                      hintText: AppStrings.mailStr,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        return ValidationHelper.validateMail(value);
                      },
                      onSaved: (value) {
                        context.read<RegisterCubit>().email = value;
                      },
                    ),
                    PasswordTextForm(
                      validator: (value) {
                        return ValidationHelper.validatePassword(value);
                      },
                      onSaved: (value) {
                        context.read<RegisterCubit>().password = value;
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    _registerButton(context)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  CustomButton _registerButton(BuildContext context) {
    return CustomButton(
        label: AppStrings.registerStr,
        onFuture: () async {
          if (_registerFormKey.currentState!.validate()) {
            _registerFormKey.currentState!.save();
            await context.read<RegisterCubit>().register();
          }
        });
  }

  AuthBottomButton _backToLoginButton(BuildContext context) {
    return AuthBottomButton(
        label: AppStrings.alreadyHaveAccountStr,
        onPressed: () {
          Navigator.pop(context);
        });
  }
}
