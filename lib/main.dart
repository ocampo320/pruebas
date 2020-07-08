import 'package:app/app/settings/app_settings.dart';
import 'package:app/app/sicom_app.dart';
import 'package:flutter/material.dart';

import 'app/settings/application.dart';

void main() {
  var appSettings = AppSettings(
    securityUrl: 'http://localhost:8182/api/sicom/v1/usuarios/user/list',
  );
  Application().appSettings = appSettings;

  runApp(SicomApp());
}
