import 'dart:convert';

import 'package:dio/dio.dart';

import '../model/user_details.dart';
import 'user_details_api.dart';

class UserDetailsService implements UserDetailsApi {
  final Dio _dio = Dio();

  @override
  Future<Response<UserDetails>> fetchUserDetails() async {
    final response = await _dio.get('https://5f383e6541c94900169bfd42.mockapi.io/api/v1/user_details');
    if (response.statusCode == 200) {
      final userDetails = UserDetails.fromJson(jsonDecode(response.data));
      return Response<UserDetails>(
        requestOptions: response.requestOptions,
        data: userDetails,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } else {
      throw Exception('Failed to fetch user details');
    }
  }
}