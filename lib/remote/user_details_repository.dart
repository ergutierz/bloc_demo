import '../model/user_details.dart';
import 'user_details_service.dart';

class UserDetailsRepository {
  final UserDetailsService _userDetailsService;

  UserDetailsRepository(this._userDetailsService);

  Future<UserDetails?> fetchUserDetails() async {
    // final response = await _userDetailsService.fetchUserDetails();
    // if (response.statusCode == 200) {
    //   return response.data;
    // }
    return null;
  }
}
