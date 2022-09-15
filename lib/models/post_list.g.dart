// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostList _$PostListFromJson(Map<String, dynamic> json) => PostList(
      list: (json['list'] as List<dynamic>)
          .map((e) => PostItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostListToJson(PostList instance) => <String, dynamic>{
      'list': instance.list,
    };
