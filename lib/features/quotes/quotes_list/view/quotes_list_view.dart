import 'package:bq_app/core/constant/app_colors.dart';
import 'package:bq_app/core/constant/app_dimensions.dart';
import 'package:bq_app/core/extensions/context_ext.dart';
import 'package:bq_app/core/style/app_text_style.dart';
import 'package:bq_app/features/quotes/add_quote/view/add_quote_view.dart';
import 'package:bq_app/features/quotes/edit_quote/view/edit_quote_view.dart';
import 'package:bq_app/features/quotes/widgets/quote_back_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_strings.dart';
import '../../../../core/widgets/delete_dialog.dart';
import '../../widgets/quote_card.dart';

class QuotesListView extends StatelessWidget {
  const QuotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const _FloatingActionButton(),
      body: SafeArea(
        child: Padding(
          padding: AppDimensions.pagePadding,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    "https://i.dr.com.tr/cache/600x600-0/originals/0000000608697-1.jpg",
                    height: context.setScaledHeight(0.36),
                    width: context.width,
                  ),
                  Text(
                    "Martin Eden " * 5,
                    style: AppTextStyle.bookNameStyle,
                  ),
                  Text(
                    "Jack London",
                    style: AppTextStyle.authorStyle,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.only(bottom: 36),
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return QuoteCard(
                                onTap: () {},
                                onDelete: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => DeleteDialog(
                                          message: AppStrings.deleteQuoteQuest,
                                          onDelete: () {
                                            Navigator.pop(context);
                                          }));
                                },
                                onEdit: () {
                                  showGeneralDialog(
                                      context: context,
                                      pageBuilder: (context, _, __) {
                                        return const EditQuoteView();
                                      });
                                },
                                onShare: () {},
                                quote: "Label " * index);
                          }))
                ],
              ),
              const QuoteBackButton()
            ],
          ),
        ),
      ),
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showGeneralDialog(
            context: context,
            pageBuilder: (context, _, __) {
              return const AddQuoteView();
            });
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
      backgroundColor: AppColors.authHeaderColor,
    );
  }
}
