import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/keys.dart';
import 'package:flutter_application_1/constants/route.dart';

import 'package:flutter_application_1/models/post_item.dart' as Model;

class PostItem extends StatelessWidget {
  final Model.PostItem item;
  final int index;
  const PostItem({Key? key, required this.item, required this.index})
      : super(key: key);

  void navigateToDetail() {
    AppKeys.navState.pushNamed(Routes.postDetail, arguments: item.id);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: navigateToDetail,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Container(
          color: index % 2 == 0 ? Colors.amberAccent : Colors.amber,
          child: SizedBox(
            height: 40,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                    left: 5,
                  ),
                  child: Text(
                    item.id.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    item.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
