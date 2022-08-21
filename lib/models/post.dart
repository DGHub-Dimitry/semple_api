import 'package:json_annotation/json_annotation.dart';
part 'post.g.dart';

@JsonSerializable(includeIfNull: true)
class Post {
  int id;
  String title;
  String body;
  int category_id;
  Map<String, dynamic> category;
  String photo;
  List<String> comments;

  Post(
      {required this.id,
      required this.body,
      required this.category,
      required this.category_id,
      required this.title,
      required this.photo,
      required this.comments});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
