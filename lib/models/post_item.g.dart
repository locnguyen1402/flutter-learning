// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostItem _$PostItemFromJson(Map<String, dynamic> json) => PostItem(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String?,
    );

Map<String, dynamic> _$PostItemToJson(PostItem instance) => <String, dynamic>{
      'albumId': instance.albumId,
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
    };
