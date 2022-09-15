import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class InfiniteScroll extends StatefulWidget {
  Widget child;
  bool loading;
  int threshold;
  Function onReachEnd;

  InfiniteScroll({
    Key? key,
    required this.child,
    required this.onReachEnd,
    this.loading = false,
    this.threshold = 500,
  }) : super(key: key);

  @override
  State<InfiniteScroll> createState() => _InfiniteScrollState();
}

class _InfiniteScrollState extends State<InfiniteScroll> {
  late ScrollController controller;

  @override
  void initState() {
    super.initState();

    controller = ScrollController()..addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: widget.child,
    );
  }

  void _scrollListener() {
    if (controller.position.userScrollDirection == ScrollDirection.reverse &&
        controller.position.extentAfter < widget.threshold &&
        !widget.loading) {
      widget.onReachEnd();
    }
  }
}
