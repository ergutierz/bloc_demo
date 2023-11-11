import 'dart:async';

import '../model/user_details.dart';
import 'user_details_api.dart';

class UserDetailsService {
  final UserDetailsApi _userDetailsApi;

  UserDetailsService(this._userDetailsApi);

  Stream<UserDetails?> fetchUserDetails() {
    return _userDetailsApi.fetchUserDetails();
  }
}