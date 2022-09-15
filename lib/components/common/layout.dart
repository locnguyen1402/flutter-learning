import 'package:flutter/material.dart';
import 'package:flutter_application_1/store/models/root_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Layout extends StatelessWidget {
  final Widget child;

  const Layout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<RootStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Vk Link',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.amber,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              store.autoStore.logout();
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: child,
    );
  }
}
