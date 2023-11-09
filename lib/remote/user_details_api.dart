import 'dart:async';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../model/user_details.dart';

@RestApi(baseUrl: 'https://5f383e6541c94900169bfd42.mockapi.io/api/v1/')
abstract class UserDetailsApi {
  @GET('user_details')
  Future<Response<UserDetails>> fetchUserDetails();
}