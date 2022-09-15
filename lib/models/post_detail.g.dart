// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostDetail _$PostDetailFromJson(Map<String, dynamic> json) => PostDetail(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String?,
    );

Map<String, dynamic> _$PostDetailToJson(PostDetail instance) =>
    <String, dynamic>{
      'albumId': instance.albumId,
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
    };
