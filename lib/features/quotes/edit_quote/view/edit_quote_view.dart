import 'package:bq_app/core/auth/cubit/auth_cubit.dart';
import 'package:bq_app/core/constant/app_colors.dart';
import 'package:bq_app/core/constant/app_dimensions.dart';
import 'package:bq_app/core/constant/app_strings.dart';
import 'package:bq_app/core/style/app_text_style.dart';
import 'package:bq_app/core/widgets/custom_button.dart';
import 'package:bq_app/core/widgets/custom_text_form.dart';
import 'package:bq_app/features/quotes/edit_quote/cubit/edit_quote_cubit.dart';
import 'package:bq_app/features/quotes/quotes_list/cubit/quotes_list_cubit.dart';
import 'package:bq_app/features/quotes/widgets/dialog_close_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/helper/validation_helper.dart';
import '../../models/quote.dart';

class EditQuoteView extends StatelessWidget {
  const EditQuoteView({Key? key, required this.selectedQuote})
      : super(key: key);
  final Quote selectedQuote;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditQuoteCubit(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: const DialogCloseButton(),
        ),
        body: _QuoteForm(selectedQuote: selectedQuote),
      ),
    );
  }
}

class _QuoteForm extends StatelessWidget {
  _QuoteForm({
    Key? key,
    required this.selectedQuote,
  }) : super(key: key);
  final _editQuoteFormKey = GlobalKey<FormState>();
  final Quote selectedQuote;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppDimensions.pagePadding,
      child: BlocListener<EditQuoteCubit, EditQuoteState>(
        listener: (context, state) {
          if (state is EditQuoteSuccess) {
            Navigator.pop(context, true);
          }
        },
        child: Form(
          key: _editQuoteFormKey,
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
                initialValue: selectedQuote.quote,
                hintText: AppStrings.quoteStr,
                textStyle: AppTextStyle.quoteStyle,
                maxLines: AppDimensions.quoteMaxLine,
                validator: (value) {
                  return ValidationHelper.isNotNullOrEmpty(value);
                },
                onSaved: (value) {
                  context.read<EditQuoteCubit>().quote = value!;
                },
              ),
              Center(
                child: CustomButton(
                    label: AppStrings.editStr,
                    buttonColor: AppColors.editButtonColor,
                    onFuture: () async{
                      if (_editQuoteFormKey.currentState!.validate()) {
                        _editQuoteFormKey.currentState!.save();
                        await context.read<EditQuoteCubit>().editQuote(
                              context.read<AuthCubit>().getUserId!,
                              context.read<QuotesListCubit>().selectedBook.id!,
                              selectedQuote,
                            );
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
