import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/keys.dart';
import 'package:flutter_application_1/services/alert_service.dart';
import 'package:flutter_application_1/services/preferences_service.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  final alertService = AlertService();
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
  void login(
    BuildContext context, {
    required String username,
    required String password,
  }) {
    loading = true;
    Future.delayed(const Duration(seconds: 2));
    if (username == "admin" && password == "admin") {
      setToken("this is test token");
    } else {
      alertService.showTextConfirmDialog(
        context,
        title: "Error",
        content: "Please check your username or password!",
        okText: "Oke",
        okCb: () {
          AppKeys.navState.pop();
        },
      );
    }
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
