import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/common/infinite-scroll.dart';
import 'package:flutter_application_1/components/post_item.dart';
import 'package:flutter_application_1/models/pagination_params.dart';
import 'package:flutter_application_1/models/post_item.dart' as Model;
import 'package:flutter_application_1/notifiers/loading.dart';
import 'package:flutter_application_1/services/post_service.dart';

class PostList extends StatefulWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  final LoadingController loadingCtrl = LoadingController();
  PostService postService = PostService();
  List<Model.PostItem> items = [];
  int totalItem = 1;
  PaginationParams paging = PaginationParams(pageNum: 0, pageSize: 10);

  @override
  void initState() {
    super.initState();

    onLoadMore(0);
  }

  Future<void> onLoadMore(int pageNum) async {
    if (loadingCtrl.isLoading) {
      return;
    }

    loadingCtrl.startLoading();
    paging.page = paging.pageNum + 1;
    var response = await postService.getPostListAsync(pagination: paging);
    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      totalItem = response.totalItem;
      items = [...items, ...response.data];
      paging = paging;
    });

    loadingCtrl.endLoading();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: loadingCtrl,
      builder: (context, loading, child) {
        return InfiniteScroll(
          onReachEnd: () {
            onLoadMore(paging.pageNum + 1);
          },
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              if (index == items.length) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              return PostItem(
                item: items[index],
                index: index,
              );
            },
            itemCount: loading ? items.length + 1 : items.length,
          ),
        );
      },
    );
  }
}
