// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) => UserDetails(
      name: json['name'] as String,
      rating: json['rating'] as int,
      played: json['played'] as int,
      won: json['won'] as int,
      winningPercentage: (json['winningPercentage'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$UserDetailsToJson(UserDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
      'rating': instance.rating,
      'played': instance.played,
      'won': instance.won,
      'winningPercentage': instance.winningPercentage,
      'imageUrl': instance.imageUrl,
    };
