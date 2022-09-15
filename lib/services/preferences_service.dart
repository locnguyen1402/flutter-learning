import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  PreferencesService(this.refs);

  final SharedPreferences refs;

  static const String _accessTokenKey = "access_token";

  set storeAccessToken(String token) {
    refs.setString(_accessTokenKey, token);
  }

  void removeAccessToken() {
    refs.remove(_accessTokenKey);
  }

  String? get getAccessToken {
    return refs.getString(_accessTokenKey);
  }
}
