import 'package:bq_app/core/constant/app_colors.dart';
import 'package:bq_app/core/constant/app_dimensions.dart';
import 'package:bq_app/core/constant/app_strings.dart';
import 'package:bq_app/core/widgets/custom_button.dart';
import 'package:bq_app/core/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';

import '../widgets/image_button.dart';

class EditBookView extends StatelessWidget {
  const EditBookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.editBookStr),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppDimensions.pagePadding,
          child: Column(
            children: [
              const SizedBox(height: 15),
               ImageButton(
                 imagePath: null,
                 onTap: (){
                   return Future.value(null);
                 },
               ),
              const CustomTextForm(hintText: AppStrings.bookNameStr),
              const CustomTextForm(hintText: AppStrings.authorStr),
              const CustomTextForm(
                  hintText: AppStrings.pageCountStr,
                  keyboardType: TextInputType.number),
              const CustomTextForm(
                  hintText: AppStrings.readPageCountStr,
                  keyboardType: TextInputType.number),
              CustomButton(
                  label: AppStrings.editStr,
                  buttonColor: AppColors.editButtonColor,
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
