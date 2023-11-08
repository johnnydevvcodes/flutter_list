import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_list/app/user_list/bloc/user_cubit.dart';
import 'package:flutter_list/app/user_list/screens/user_list_screen.dart';
import 'package:flutter_list/core/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child: MultiBlocProvider(
        providers: [BlocProvider(create: (_) => Modular.get<UserCubit>())],
        child: const FlutterList(),
      ),
    ),
  );
}

class FlutterList extends StatelessWidget {
  const FlutterList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter List',
      theme: ThemeData.dark(),
      home: const UserListScreen(),
    );
  }
}
