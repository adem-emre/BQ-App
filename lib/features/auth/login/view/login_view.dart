import 'package:bq_app/core/constant/app_assets.dart';
import 'package:bq_app/core/constant/app_dimensions.dart';
import 'package:bq_app/core/constant/app_strings.dart';
import 'package:bq_app/core/widgets/custom_button.dart';
import 'package:bq_app/core/widgets/custom_text_form.dart';
import 'package:bq_app/features/auth/login/cubit/login_cubit.dart';
import 'package:bq_app/features/auth/register/view/register_view.dart';
import 'package:bq_app/features/auth/reset_password/view/reset_password_view.dart';
import 'package:bq_app/features/auth/widgets/auth_bottom_button.dart';
import 'package:bq_app/features/auth/widgets/lottie_box.dart';
import 'package:bq_app/features/books/books_home/view/books_home_view.dart';
import 'package:bq_app/utils/helper/validation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/auth_header.dart';
import '../../widgets/password_text_form.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BooksHomeView()));
              } else if (state is LoginError) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: const Duration(milliseconds: 500),
                    content: Text(state.message)));
              }
            },
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const AuthHeader(),
                        const LottieBox(lottiePath: AppAssets.booksLottie),
                        Text(
                          AppStrings.welcomeStr,
                          style: GoogleFonts.inconsolata(
                              fontWeight: FontWeight.bold, fontSize: 27),
                        ),
                        _loginForm(context),
                      ],
                    ),
                  ),
                ),
                _signUpButton(context)
              ],
            ),
          ),
        );
      }),
    );
  }

  Padding _loginForm(BuildContext context) {
    return Padding(
      padding: AppDimensions.pagePadding,
      child: Form(
        key: _loginFormKey,
        child: Column(
          children: [
            CustomTextForm(
                keyboardType: TextInputType.emailAddress,
                validator: (mail) {
                  return ValidationHelper.validateMail(mail?.trim());
                },
                onSaved: (mail) {
                  context.read<LoginCubit>().email = mail?.trim();
                },
                hintText: AppStrings.mailStr),
            PasswordTextForm(
              validator: (password) {
                return ValidationHelper.validatePassword(password?.trim());
              },
              onSaved: (password) {
                context.read<LoginCubit>().password = password?.trim();
              },
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ResetPasswordView()));
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
            _loginButton(context)
          ],
        ),
      ),
    );
  }

  CustomButton _loginButton(BuildContext context) {
    return CustomButton(
        label: AppStrings.loginStr,
        onFuture: () async {
          if (_loginFormKey.currentState!.validate()) {
            _loginFormKey.currentState!.save();
            await context.read<LoginCubit>().login();
          }
        });
  }

  AuthBottomButton _signUpButton(BuildContext context) {
    return AuthBottomButton(
        label: AppStrings.noAccountStr,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const RegisterView()));
        });
  }
}
