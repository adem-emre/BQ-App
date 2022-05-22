import 'package:bq_app/core/auth/cubit/auth_cubit.dart';
import 'package:bq_app/core/constant/app_colors.dart';
import 'package:bq_app/core/constant/app_dimensions.dart';
import 'package:bq_app/core/constant/app_strings.dart';
import 'package:bq_app/core/style/app_text_style.dart';
import 'package:bq_app/core/widgets/custom_button.dart';
import 'package:bq_app/core/widgets/custom_text_form.dart';
import 'package:bq_app/features/quotes/add_quote/cubit/add_quote_cubit.dart';
import 'package:bq_app/features/quotes/quotes_list/cubit/quotes_list_cubit.dart';
import 'package:bq_app/features/quotes/widgets/dialog_close_button.dart';
import 'package:bq_app/utils/helper/validation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddQuoteView extends StatelessWidget {
  const AddQuoteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddQuoteCubit(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: const DialogCloseButton(),
        ),
        body: _QuoteForm(),
      ),
    );
  }
}

class _QuoteForm extends StatelessWidget {
  _QuoteForm({
    Key? key,
  }) : super(key: key);

  final _quoteFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppDimensions.pagePadding,
      child: BlocListener<AddQuoteCubit, AddQuoteState>(
        listener: (context, state) {
          if (state is AddQuoteSuccess) {
            Navigator.pop(context,true);
          }
        },
        child: Form(
          key: _quoteFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.read<QuotesListCubit>().selectedBook.title,
                style: AppTextStyle.bookNameStyle,
              ),
              Text(
                context.read<QuotesListCubit>().selectedBook.author,
                style: AppTextStyle.authorStyle,
              ),
              CustomTextForm(
                hintText: AppStrings.quoteStr,
                textStyle: AppTextStyle.quoteStyle,
                maxLines: AppDimensions.quoteMaxLine,
                validator: (value) {
                  return ValidationHelper.isNotNullOrEmpty(value);
                },
                onSaved: (value) {
                  context.read<AddQuoteCubit>().quote = value!;
                },
              ),
              Center(
                child: CustomButton(
                  label: AppStrings.saveStr,
                  buttonColor: AppColors.addButtonColor,
                  onFuture: () async{
                    if (_quoteFormKey.currentState!.validate()) {
                      _quoteFormKey.currentState!.save();
                        await context.read<AddQuoteCubit>().addQuote(
                          context.read<AuthCubit>().getUserId!,
                          context.read<QuotesListCubit>().selectedBook.id!);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
