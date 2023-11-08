import 'dart:convert';

import 'package:flutter_list/core/core.dart';
import 'package:flutter_list/data/data.dart';

abstract class UserRepo {
  Future<(List<UserEntity>, String error)> getUsers();
}

class UserRepoImpl extends UserRepo {
  UserRepoImpl(this.client);

  final UserClient client;

  @override
  Future<(List<UserEntity>, String error)> getUsers() async {
    try {
      final rawUsers = await client.getUsers();
      final decodedUsers = jsonDecode(rawUsers.toString()) as List;
      mapper(e) => UserResponseMapper.fromMap(e);
      final users = decodedUsers.map(mapper).toList();
      return (users.toEntities, '');
    } catch (e) {
      return (<UserEntity>[], e.toString());
    }
  }
}
