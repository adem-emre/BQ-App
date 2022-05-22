import 'package:bq_app/core/extensions/context_ext.dart';
import 'package:bq_app/core/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/constant/app_colors.dart';

class QuoteCard extends StatelessWidget {
  final String quote;
  final Function() onTap;
  final Function() onDelete;
  final Function() onEdit;
  final Function() onShare;
  const QuoteCard({
    Key? key,
    required this.onTap,
    required this.onDelete,
    required this.onEdit,
    required this.onShare,
    required this.quote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.quoteContainerColor,
      elevation: 6,
      child: Slidable(
        startActionPane: ActionPane(
          motion: const BehindMotion(),
          children: [
            SlidableAction(
                backgroundColor: AppColors.twitterColor,
                icon: FontAwesomeIcons.twitter,
                onPressed: (context) {
                  onShare();
                }),
          ],
        ),
        endActionPane: ActionPane(
          motion: const BehindMotion(),
          children: [
            SlidableAction(
                backgroundColor: AppColors.deleteButtonColor,
                icon: Icons.delete,
                onPressed: (context) {
                  onDelete();
                }),
            SlidableAction(
                foregroundColor: Colors.white,
                backgroundColor: AppColors.editButtonColor,
                icon: Icons.edit,
                onPressed: (context) {
                  onEdit();
                }),
          ],
        ),
        child: InkWell(
          onTap: () {
            onTap();
          },
          child: Container(
              padding: const EdgeInsets.all(9),
              width: context.width,
              constraints: const BoxConstraints(minHeight: 60),
              child: Text(quote,
                  style: AppTextStyle.quoteStyle)),
        ),
      ),
    );
  }
}
