import 'package:json_annotation/json_annotation.dart';

part 'post_detail.g.dart';

@JsonSerializable()
class PostDetail {
  int albumId;
  int id;
  String title;
  String url;
  String? thumbnailUrl;

  PostDetail({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    this.thumbnailUrl,
  });

  factory PostDetail.fromJson(Map<String, dynamic> json) =>
      _$PostDetailFromJson(json);

  Map<String, dynamic> toJson() => _$PostDetailToJson(this);
}
