import 'package:flutter/material.dart';

import 'app/settings/app_settings.dart';
import 'app/settings/application.dart';
import 'app/sicom_app.dart';

void main() {
  var appSettings = AppSettings(
    securityUrl: '',
  );
  Application().appSettings = appSettings;

  runApp(SicomApp());
}
