import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_list/app/user_list/bloc/user_cubit.dart';
import 'package:flutter_list/app/user_list/bloc/user_state.dart';
import 'package:flutter_list/app/user_list/widgets/user_item_widget.dart';
import 'package:gap/gap.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter List')),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          switch (state) {
            case ErrorState():
              return Center(child: Text(state.error));
            case EmptyState():
              return const Center(child: Text('Empty list.'));
            case InitialState():
            case LoadingState():
              return const Center(child: CircularProgressIndicator.adaptive());
            case UsersLoadedState():
              return RefreshIndicator(
                onRefresh: context.read<UserCubit>().initialize,
                child: ListView.builder(
                  itemCount: state.users.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        if (index == 0) const Gap(16),
                        UserItemWidget(state.users[index]),
                      ],
                    );
                  },
                ),
              );
          }
        },
      ),
    );
  }
}
