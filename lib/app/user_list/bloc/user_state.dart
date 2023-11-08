import 'package:flutter_list/core/core.dart';

sealed class UserState {}

class UsersLoadedState extends UserState {
  UsersLoadedState(this.users);
  final List<UserEntity> users;
}

class ErrorState extends UserState {
  ErrorState(this.error);
  final String error;
}

class EmptyState extends UserState {}

class InitialState extends UserState {}

class LoadingState extends UserState {}
