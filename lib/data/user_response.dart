import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_list/core/user_entity.dart';

part 'user_response.mapper.dart';

@MappableClass()
class UserResponse extends UserEntity with UserResponseMappable {
  UserResponse({
    required super.id,
    required super.name,
    required super.imageUrl,
  });
}

extension UsersToEntities on List<UserResponse> {
  List<UserEntity> get toEntities {
    final entities = <UserEntity>[];
    final uniqueIds = [];
    for (final user in this) {
      if (uniqueIds.contains(user.id)) continue;
      entities.add(UserEntity(
        id: user.id,
        name: user.name,
        imageUrl: user.imageUrl,
      ));
      uniqueIds.add(user.id);
    }
    return entities;
  }
}
