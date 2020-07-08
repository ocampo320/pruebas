import 'package:app/app/settings/app_settings.dart';
import 'package:app/app/settings/application.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('AppSettings should return an instance', () {
    var appSettings = AppSettings(
      securityUrl: 'url',
    );
    expect(appSettings.securityUrl, 'url');
  });
  test('Application should return an instance', () {
    var application = Application();
    expect(application != null, true);
  });
}
