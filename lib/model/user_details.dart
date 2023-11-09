import 'package:serializable/serializable.dart';

@serializable
class UserDetails {
  final int id;
  final String name;
  final String email;
  final String avatarUrl;

  UserDetails({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      avatarUrl: json['avatar_url'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'avatar_url': avatarUrl,
  };
}