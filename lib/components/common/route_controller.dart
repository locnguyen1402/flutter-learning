import 'dart:collection';

import 'package:flutter/widgets.dart';

class RouteController extends MapMixin<String, WidgetBuilder> {
  final Map<String, WidgetBuilder> public;
  final Map<String, WidgetBuilder> private;

  RouteController({required this.public, required this.private});

  @override
  WidgetBuilder? operator [](Object key) {
    if (public.containsKey(key)) {
      return public[key];
    }

    if (private.containsKey(key)) {
      if (MyAuth.isUserLoggedIn) {
        return private[key];
      }

      return null;
    }

    return null;
  }

  @override
  void operator []=(key, value) {}

  @override
  void clear() {}

  @override
  Iterable<String> get keys {
    final set = Set<String>();
    set.addAll(public.keys);
    set.addAll(private.keys);
    return set;
  }

  @override
  WidgetBuilder remove(Object key) {
    return public[key] ?? private[key];
  }
}
