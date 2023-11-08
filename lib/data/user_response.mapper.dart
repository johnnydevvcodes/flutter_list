// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'user_response.dart';

class UserResponseMapper extends ClassMapperBase<UserResponse> {
  UserResponseMapper._();

  static UserResponseMapper? _instance;
  static UserResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserResponseMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'UserResponse';

  static String _$id(UserResponse v) => v.id;
  static const Field<UserResponse, String> _f$id = Field('id', _$id);
  static String _$name(UserResponse v) => v.name;
  static const Field<UserResponse, String> _f$name = Field('name', _$name);
  static String _$imageUrl(UserResponse v) => v.imageUrl;
  static const Field<UserResponse, String> _f$imageUrl =
      Field('imageUrl', _$imageUrl);

  @override
  final Map<Symbol, Field<UserResponse, dynamic>> fields = const {
    #id: _f$id,
    #name: _f$name,
    #imageUrl: _f$imageUrl,
  };

  static UserResponse _instantiate(DecodingData data) {
    return UserResponse(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        imageUrl: data.dec(_f$imageUrl));
  }

  @override
  final Function instantiate = _instantiate;

  static UserResponse fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<UserResponse>(map));
  }

  static UserResponse fromJson(String json) {
    return _guard((c) => c.fromJson<UserResponse>(json));
  }
}

mixin UserResponseMappable {
  String toJson() {
    return UserResponseMapper._guard((c) => c.toJson(this as UserResponse));
  }

  Map<String, dynamic> toMap() {
    return UserResponseMapper._guard((c) => c.toMap(this as UserResponse));
  }

  UserResponseCopyWith<UserResponse, UserResponse, UserResponse> get copyWith =>
      _UserResponseCopyWithImpl(this as UserResponse, $identity, $identity);
  @override
  String toString() {
    return UserResponseMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            UserResponseMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return UserResponseMapper._guard((c) => c.hash(this));
  }
}

extension UserResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserResponse, $Out> {
  UserResponseCopyWith<$R, UserResponse, $Out> get $asUserResponse =>
      $base.as((v, t, t2) => _UserResponseCopyWithImpl(v, t, t2));
}

abstract class UserResponseCopyWith<$R, $In extends UserResponse, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? name, String? imageUrl});
  UserResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserResponse, $Out>
    implements UserResponseCopyWith<$R, UserResponse, $Out> {
  _UserResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserResponse> $mapper =
      UserResponseMapper.ensureInitialized();
  @override
  $R call({String? id, String? name, String? imageUrl}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (imageUrl != null) #imageUrl: imageUrl
      }));
  @override
  UserResponse $make(CopyWithData data) => UserResponse(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      imageUrl: data.get(#imageUrl, or: $value.imageUrl));

  @override
  UserResponseCopyWith<$R2, UserResponse, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserResponseCopyWithImpl($value, $cast, t);
}
