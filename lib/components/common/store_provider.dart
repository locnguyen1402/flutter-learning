import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoreProvider<T> extends StatelessWidget {
  Widget child;
  T store;

  StoreProvider({Key? key, required this.child, required this.store})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => store,
      child: child,
    );
  }
}
