import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/components/common/layout.dart';
import 'package:flutter_application_1/screens/auth/login_screen.dart';
import 'package:flutter_application_1/screens/auth/register_screen.dart';
import 'package:flutter_application_1/screens/homepage.dart';
import 'package:flutter_application_1/screens/post_detail_screen.dart';
import 'package:flutter_application_1/screens/post_list_screen.dart';

class Routes {
  static const String login = "/login";
  static const String register = "/register";

  static const String home = "/";

  static const String postList = "/posts";
  static const String postDetail = "/posts/detail";
}

final Map<String, WidgetBuilder> authRoutes = {
  Routes.login: (context) {
    return LoginScreen(key: UniqueKey());
  },
  Routes.register: (context) {
    return RegisterScreen(key: UniqueKey());
  },
};

final Map<String, WidgetBuilder> protectedRoutes = {
  Routes.home: (context) => const Layout(
        child: HomePage(),
      ),
  Routes.postList: (context) => const Layout(
        child: PostListScreen(),
      ),
  Routes.postDetail: (context) => const Layout(
        child: PostDetailScreen(),
      )
};
