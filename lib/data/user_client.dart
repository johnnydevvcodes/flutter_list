import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'user_client.g.dart';

@RestApi(baseUrl: 'https://gist.githubusercontent.com/dustincatap')
abstract class UserClient {
  factory UserClient(Dio dio, {String baseUrl}) = _UserClient;

  @GET('/{firstKey}/raw/{secondKey}/users.json')
  Future<String?> getUsers({
    @Path() String? firstKey = "66d48847b3ca07af7cef789d6ac8fee8",
    @Path() String? secondKey = "550798be0efa8b98f6924cfb4ad812cd290f568a",
  });
}
