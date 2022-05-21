part of '../quotes_list_view.dart';

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        bool? isSuccessful = await showGeneralDialog<bool?>(
            context: context,
            pageBuilder: (context, _, __) {
              return const AddQuoteView();
            });
        if (isSuccessful == true) {
          context
              .read<QuotesListCubit>()
              .fetchQuotes(context.read<AuthCubit>().getUserId!);
        }
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
      backgroundColor: AppColors.authHeaderColor,
    );
  }
}