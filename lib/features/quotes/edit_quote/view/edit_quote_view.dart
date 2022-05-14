import 'package:bq_app/core/constant/app_colors.dart';
import 'package:bq_app/core/constant/app_dimensions.dart';
import 'package:bq_app/core/constant/app_strings.dart';
import 'package:bq_app/core/style/app_text_style.dart';
import 'package:bq_app/core/widgets/custom_button.dart';
import 'package:bq_app/core/widgets/custom_text_form.dart';
import 'package:bq_app/features/quotes/widgets/dialog_close_button.dart';
import 'package:flutter/material.dart';

class EditQuoteView extends StatelessWidget {
  const EditQuoteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const DialogCloseButton(),
      ),
      body: SingleChildScrollView(
        padding: AppDimensions.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Martin Eden",
              style: AppTextStyle.bookNameStyle,
            ),
            Text(
              "Jack London",
              style: AppTextStyle.authorStyle,
            ),
            CustomTextForm(
              hintText: AppStrings.quoteStr,
              textStyle: AppTextStyle.quoteStyle,
              maxLines: AppDimensions.quoteMaxLine,
            ),
            Center(
              child: CustomButton(
                label: AppStrings.editStr,
                buttonColor: AppColors.editButtonColor,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
