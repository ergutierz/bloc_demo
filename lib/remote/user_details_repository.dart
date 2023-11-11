import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

import '../model/user_details.dart';
import 'user_details_service.dart';

class UserDetailsRepository {
  final UserDetailsService _userDetailsService;

  UserDetailsRepository(this._userDetailsService);

  Stream<UserDetails?> fetchUserDetails() {
    return _userDetailsService
        .fetchUserDetails()
        .onErrorReturnWith((error, stackTrace) {
          if (kDebugMode) {
            print('Error: $error');
          }
          return null;
        });
  }
}
