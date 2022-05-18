import 'package:bq_app/core/auth/cubit/auth_cubit.dart';
import 'package:bq_app/core/constant/app_colors.dart';
import 'package:bq_app/core/constant/app_dimensions.dart';
import 'package:bq_app/core/constant/app_strings.dart';
import 'package:bq_app/core/widgets/custom_button.dart';
import 'package:bq_app/core/widgets/custom_text_form.dart';
import 'package:bq_app/features/books/add_book/cubit/add_book_cubit.dart';
import 'package:bq_app/utils/helper/validation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/image_button.dart';

class AddBookView extends StatelessWidget {
  const AddBookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddBookCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.addBookStr),
        ),
        body: _BookForm(),
      ),
    );
  }
}

class _BookForm extends StatelessWidget {
  _BookForm({
    Key? key,
  }) : super(key: key);

  final _addBookFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocListener<AddBookCubit, AddBookState>(
        listener: (context, state) {
          if (state is AddBookSuccess) {
            Navigator.of(context).pop();
          } else if (state is AddBookError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: AppDimensions.snackBarDuration,
              content: Text(state.message),
            ));
          }
        },
        child: Padding(
          padding: AppDimensions.pagePadding,
          child: Form(
            key: _addBookFormKey,
            child: Column(
              children: [
                const SizedBox(height: 15),
                ImageButton(
                  onTap: () async {
                    String? imagePath =
                        await context.read<AddBookCubit>().addImage();
                    return imagePath;
                  },
                ),
                CustomTextForm(
                  hintText: AppStrings.bookNameStr,
                  validator: (value) {
                    return ValidationHelper.isNotNullOrEmpty(value);
                  },
                  onSaved: (value) {
                    context.read<AddBookCubit>().bookName = value;
                  },
                ),
                CustomTextForm(
                  hintText: AppStrings.authorStr,
                  validator: (value) {
                    return ValidationHelper.isNotNullOrEmpty(value);
                  },
                  onSaved: (value) {
                    context.read<AddBookCubit>().author = value;
                  },
                ),
                CustomTextForm(
                  hintText: AppStrings.pageCountStr,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    return ValidationHelper.isNotNullOrEmpty(value);
                  },
                  onSaved: (value) {
                    context.read<AddBookCubit>().pages = int.parse(value!);
                  },
                ),
                CustomTextForm(
                  hintText: AppStrings.readPageCountStr,
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    if (value != null && value.isNotEmpty) {
                      context.read<AddBookCubit>().readPages = int.parse(value);
                    }
                  },
                ),
                CustomButton(
                    label: AppStrings.addStr,
                    buttonColor: AppColors.addButtonColor,
                    onFuture: () async {
                      if (_addBookFormKey.currentState!.validate()) {
                        _addBookFormKey.currentState!.save();
                        await context.read<AddBookCubit>().addBook(
                              context.read<AuthCubit>().getUserId!,
                            );
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
