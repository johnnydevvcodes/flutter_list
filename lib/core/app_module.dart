import 'package:dio/dio.dart';
import 'package:flutter_list/app/user_list/bloc/user_cubit.dart';
import 'package:flutter_list/data/data.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.add<UserRepo>(UserRepoImpl.new);
    i.addInstance(Dio());
    i.add(UserClient.new);
    i.add(UserCubit.new);
  }
}
