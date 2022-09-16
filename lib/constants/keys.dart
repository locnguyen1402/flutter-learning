import 'package:flutter/material.dart';

class AppKeys {
  static final navKey = GlobalKey<NavigatorState>();

  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  static NavigatorState get navState {
    return navKey.currentState!;
  }

  static ScaffoldMessengerState get scaffoldMessengerState {
    return scaffoldMessengerKey.currentState!;
  }
}
