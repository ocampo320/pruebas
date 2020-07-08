import 'dart:async';

import 'app_settings.dart';

class Application {
  static Application _singleton;

  AppSettings appSettings;
  String token;
  String appVersion;
  String environment;
  String engineUserId;

  StreamController<bool> logoutController;
  Stream<bool> logoutStream;

  factory Application() {
    if (_singleton == null) {
      _singleton = Application._();
    }
    return _singleton;
  }

  Application._() {
    logoutController = StreamController.broadcast();
    logoutStream = logoutController.stream;
  }
}
