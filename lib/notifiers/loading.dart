import 'package:flutter/foundation.dart';

class LoadingController extends ValueNotifier<bool> {
  bool get isLoading {
    return value;
  }

  LoadingController() : super(false);

  void startLoading() {
    value = true;
  }

  void endLoading() {
    value = false;
  }
}
