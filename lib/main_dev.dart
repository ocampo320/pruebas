import 'package:app/app/sicom_app.dart';
import 'package:flutter/cupertino.dart';

import 'app/settings/app_settings.dart';
import 'app/settings/application.dart';

void main() {
  var appSettings = AppSettings(
    securityUrl: '',
  );
  Application().appSettings = appSettings;

  runApp(SicomApp());
}
