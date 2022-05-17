import 'package:bq_app/core/auth/cubit/auth_cubit.dart';
import 'package:bq_app/features/auth/login/view/login_view.dart';
import 'package:bq_app/features/books/books_home/view/books_home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  navigateUser(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 500), () {
      if (context.read<AuthCubit>().isAuthanticated) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const BooksHomeView()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginView()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: navigateUser(context),
      builder: (context, snapshot) {
        return Container(
          color: Colors.green,
        );
      },
    );
  }
}
