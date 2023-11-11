import 'package:json_annotation/json_annotation.dart';
part 'user_details.g.dart';

@JsonSerializable()
class UserDetails {
  final String? name;
  final int rating;
  final int played;
  final int won;
  @JsonKey(name: 'winning_percentage')
  final double winningPercentage;
  final String? image;

  UserDetails({
    this.name,
    required this.rating,
    required this.played,
    required this.won,
    required this.winningPercentage,
    this.image,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => _$UserDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);
}
