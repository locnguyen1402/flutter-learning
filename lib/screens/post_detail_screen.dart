import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/keys.dart';
import 'package:flutter_application_1/constants/route.dart';
import 'package:flutter_application_1/models/post_detail.dart';

import 'package:flutter_application_1/services/post_service.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({Key? key}) : super(key: key);

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  PostService postService = PostService();
  Future<PostDetail>? detail;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final detailId = ModalRoute.of(context)?.settings.arguments as int;

    if (detailId.isNaN) {
      AppKeys.navState.pushNamed(Routes.postList);
      return;
    }

    postService.getPostDetailAsync(id: detailId).then((response) {
      setState(() {
        detail = Future.value(response.data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PostDetail>(
      future: detail,
      builder: ((context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Center(
          child: Column(
            children: [
              Text(snapshot.data!.id.toString()),
              Text(snapshot.data!.title),
            ],
          ),
        );
      }),
    );
  }
}
