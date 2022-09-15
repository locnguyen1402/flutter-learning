import 'package:flutter_application_1/services/preferences_service.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  final PreferencesService _preferencesService;

  AuthStoreBase(this._preferencesService) {
    token = _preferencesService.getAccessToken ?? "";
  }

  @observable
  String token = "";

  @observable
  bool loading = false;

  @computed
  bool get isAuthenticated {
    return token.isNotEmpty;
  }

  @action
  void login() {
    loading = true;
    Future.delayed(const Duration(seconds: 2));
    setToken("this is test token");
    loading = false;
  }

  @action
  void logout() {
    removeToken();
  }

  @JsonKey(ignore: true)
  void setToken(String val) {
    token = val;
    _preferencesService.storeAccessToken = val;
  }

  @JsonKey(ignore: true)
  void removeToken() {
    token = "";
    _preferencesService.removeAccessToken();
  }
}
