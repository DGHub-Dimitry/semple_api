// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as int,
      body: json['body'] as String,
      category: json['category'] as Map<String, dynamic>,
      category_id: json['category_id'] as int,
      title: json['title'] as String,
      photo: json['photo'] as String,
      comments:
          (json['comments'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'category_id': instance.category_id,
      'category': instance.category,
      'photo': instance.photo,
      'comments': instance.comments,
    };
