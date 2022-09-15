import 'package:json_annotation/json_annotation.dart';

part 'post_item.g.dart';

@JsonSerializable()
class PostItem {
  int albumId;
  int id;
  String title;
  String url;
  String? thumbnailUrl;

  PostItem({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    this.thumbnailUrl,
  });

  factory PostItem.fromJson(Map<String, dynamic> json) =>
      _$PostItemFromJson(json);

  Map<String, dynamic> toJson() => _$PostItemToJson(this);
}
