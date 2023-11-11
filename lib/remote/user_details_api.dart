import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../model/user_details.dart';

part 'user_details_api.g.dart';

@RestApi(baseUrl: 'https://5f383e6541c94900169bfd42.mockapi.io/api/v1/')
abstract class UserDetailsApi {
  factory UserDetailsApi(Dio dio) = _UserDetailsApi;

  @GET('user_details')
  Stream<UserDetails?> fetchUserDetails();
}
