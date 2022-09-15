import 'package:flutter_application_1/services/preferences_service.dart';
import 'package:flutter_application_1/store/models/auth_store.dart';
import 'package:mobx/mobx.dart';

part 'root_store.g.dart';

class RootStore = RootStoreBase with _$RootStore;

abstract class RootStoreBase with Store {
  final PreferencesService _preferencesService;
  late final AuthStore autoStore;

  RootStoreBase(this._preferencesService) {
    autoStore = AuthStore(_preferencesService);
  }
}
