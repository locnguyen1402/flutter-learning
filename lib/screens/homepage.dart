import 'package:flutter/material.dart';

import 'package:flutter_application_1/constants/keys.dart';
import 'package:flutter_application_1/constants/route.dart';
import 'package:flutter_application_1/store/models/root_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void navigateToPostList() {
    AppKeys.navState.pushNamed(Routes.postList);
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<RootStore>(context);

    return Center(
      child: Column(
        children: [
          Consumer<RootStore>(
            builder: (_, testStore, __) => Observer(
              builder: (_) => Text(
                'isAuthenticated => ${testStore.autoStore.isAuthenticated}',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: navigateToPostList,
            child: Observer(
              builder: ((context) =>
                  Text('Post List ${store.autoStore.isAuthenticated}')),
            ),
          )
        ],
      ),
    );
  }
}
