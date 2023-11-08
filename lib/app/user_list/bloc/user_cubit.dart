import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_list/app/user_list/bloc/user_state.dart';
import 'package:flutter_list/data/data.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.repo) : super(InitialState());
  final UserRepo repo;

  Future initialize() async {
    emit(LoadingState());
    final users = await repo.getUsers();
    final error = users.$2;
    final userList = users.$1;
    if (error.isNotEmpty) return emit(ErrorState(users.$2));
    if (userList.isEmpty) return emit(EmptyState());
    return emit(UsersLoadedState(userList));
  }
}
