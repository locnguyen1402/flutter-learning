import 'package:flutter/widgets.dart';

class AppKeys {
  static final navKey = GlobalKey<NavigatorState>();

  static NavigatorState get navState {
    return navKey.currentState!;
  }
}
