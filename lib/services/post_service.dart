import 'dart:convert';

import 'package:flutter_application_1/constants/api.dart';
import 'package:flutter_application_1/models/api_response.dart';
import 'package:flutter_application_1/models/pagination_params.dart';
import 'package:flutter_application_1/models/post_detail.dart';
import 'package:flutter_application_1/models/post_item.dart';
import 'package:flutter_application_1/models/post_list.dart';

import 'package:http/http.dart' as http;

// class HttpClient extends http.BaseClient {
//   final String userAccessToken = "";

//   @override
//   Future<http.StreamedResponse> send(http.BaseRequest request) {
//     if (userAccessToken.isNotEmpty) {
//       request.headers.putIfAbsent('Authorization', () => userAccessToken);
//     }

//     return request.send();
//   }
// }

class PostService {
  Future<PaginationSuccessResponse<PostItem>> getPostListAsync(
      {required PaginationParams pagination}) {
    return http
        .get(Api.postListUrl({
      '_limit': pagination.pageSize.toString(),
      '_start':
          (pagination.pageSize! * pagination.pageNum - pagination.pageSize!)
              .toString()
    }))
        .then((data) {
      final String? totalItem = data.headers['x-total-count'];

      if (data.statusCode == 200 && (totalItem?.isNotEmpty ?? false)) {
        final jsonData = json.decode(data.body);
        final PostList postList = PostList.fromJson({'list': jsonData});

        return PaginationSuccessResponse(
            data: postList.list, totalItem: int.parse(totalItem!));
      }

      return PaginationSuccessResponse(data: [], totalItem: 0);
    });
  }

  Future<SuccessResponse<PostDetail>> getPostDetailAsync({required int id}) {
    return http.get(Api.postDetailUrl(id)).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final PostDetail postDetail = PostDetail.fromJson(jsonData);

        return SuccessResponse(data: postDetail);
      }

      return SuccessResponse(data: {} as PostDetail);
    });
  }
}
