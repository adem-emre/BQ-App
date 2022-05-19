import 'package:bq_app/core/auth/cubit/auth_cubit.dart';
import 'package:bq_app/core/constant/app_colors.dart';
import 'package:bq_app/core/constant/app_dimensions.dart';
import 'package:bq_app/core/constant/app_strings.dart';
import 'package:bq_app/core/widgets/custom_button.dart';
import 'package:bq_app/core/widgets/custom_text_form.dart';
import 'package:bq_app/features/books/edit_book/cubit/edit_book_cubit.dart';
import 'package:bq_app/utils/helper/validation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/book.dart';
import '../../widgets/image_button.dart';

class EditBookView extends StatelessWidget {
  const EditBookView({Key? key, required this.selectedBook}) : super(key: key);
  final Book selectedBook;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditBookCubit(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.editBookStr),
          ),
          body: _EditBookForm(selectedBook: selectedBook)),
    );
  }
}

class _EditBookForm extends StatelessWidget {
  _EditBookForm({
    Key? key,
    required this.selectedBook,
  }) : super(key: key);

  final Book selectedBook;
  final _editBookFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditBookCubit, EditBookState>(
      listener: (context, state) {
        if (state is EditBookSuccess) {
          Navigator.of(context).pop(true);
        }
        else if(state is EditBookError){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: AppDimensions.snackBarDuration,
            content: Text(state.message),
          ));
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: AppDimensions.pagePadding,
          child: Form(
            key: _editBookFormKey,
            child: Column(
              children: [
                const SizedBox(height: 15),
                ImageButton(
                  imagePath: selectedBook.imageUrl,
                  onTap: () {
                    return context.read<EditBookCubit>().addImage();
                  },
                ),
                CustomTextForm(
                  hintText: AppStrings.bookNameStr,
                  initialValue: selectedBook.title,
                  validator: (value) {
                    return ValidationHelper.isNotNullOrEmpty(value);
                  },
                  onSaved: (value) {
                    context.read<EditBookCubit>().bookName = value;
                  },
                ),
                CustomTextForm(
                  hintText: AppStrings.authorStr,
                  initialValue: selectedBook.author,
                  validator: (value) {
                    return ValidationHelper.isNotNullOrEmpty(value);
                  },
                  onSaved: (value) {
                    context.read<EditBookCubit>().author = value;
                  },
                ),
                CustomTextForm(
                  hintText: AppStrings.pageCountStr,
                  keyboardType: TextInputType.number,
                  initialValue: selectedBook.pages.toString(),
                  validator: (value) {
                    return ValidationHelper.isNotNullOrEmpty(value);
                  },
                  onSaved: (value) {
                    context.read<EditBookCubit>().pages = int.parse(value!);
                  },
                ),
                CustomTextForm(
                  hintText: AppStrings.readPageCountStr,
                  keyboardType: TextInputType.number,
                  initialValue: selectedBook.readPages.toString(),
                  validator: (value) {
                    return ValidationHelper.isNotNullOrEmpty(value);
                  },
                  onSaved: (value) {
                    context.read<EditBookCubit>().readPages = int.parse(value!);
                  },
                ),
                CustomButton(
                    label: AppStrings.editStr,
                    buttonColor: AppColors.editButtonColor,
                    onFuture: ()async {
                      if (_editBookFormKey.currentState!.validate()) {
                        _editBookFormKey.currentState!.save();
                        await context.read<EditBookCubit>().editBook(
                            context.read<AuthCubit>().getUserId!, selectedBook);
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
