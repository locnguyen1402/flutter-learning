import 'package:flutter_application_1/models/post_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_list.g.dart';

@JsonSerializable()
class PostList {
  List<PostItem> list;

  PostList({
    required this.list,
  });

  factory PostList.fromJson(Map<String, dynamic> json) =>
      _$PostListFromJson(json);

  Map<String, dynamic> toJson() => _$PostListToJson(this);
}
