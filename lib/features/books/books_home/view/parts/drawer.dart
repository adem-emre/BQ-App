part of '../books_home_view.dart';

class _Drawer extends StatelessWidget {
  const _Drawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is AuthInfoSuccess) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CircleAvatar(
                          radius: 36,
                          child: Text(
                              state.user.name.substring(0, 1).toUpperCase(),
                              style: const TextStyle(fontSize: 36)),
                        ),
                      ),
                      Text(
                        "${state.user.name} ${state.user.surName}",
                      ),
                    ],
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                );
              },
            ),
          ),
          Column(
            children: [
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text(AppStrings.logoutStr),
                onTap: ()async {
                  await context.read<AuthCubit>().logout();
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> LoginView()), (route) => false);
                },
              ),
              
            ],
          )
        ],
      ),
    );
  }
}
