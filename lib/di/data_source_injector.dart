import 'package:app/app/settings/application.dart';
import 'package:app/data_source/api/purchase_order_api_source.dart';
import 'package:app/data_source/api/security_api_source.dart';
import 'package:app/data_source/data_base/security_db_source.dart';
import 'package:app/utils/connectivity/my_connectivity.dart';
import 'package:app/utils/connectivity/my_connectivity_impl.dart';
import 'package:data/purchase_order_repository.dart';
import 'package:data/security_repository.dart';

class DataSourceInjector {
  static DataSourceInjector _singleton;
  MyConnectivity _myConnectivity;

  factory DataSourceInjector() {
    if (_singleton == null) {
      _singleton = DataSourceInjector._();
    }
    return _singleton;
  }

  DataSourceInjector._() {
    _myConnectivity = MyConnectivityImpl();
  }

  SecurityApiSource provideSecurityApiSource() {
    return SecurityApiSourceImpl(
      Application().appSettings?.securityUrl,
      _myConnectivity,
      token: Application().token,
    );
  }

  SecurityDBSource provideSecurityDBSource() {
    return SecurityDBSourceImpl();
  }

  PurchaseOrderApiSource providePurchaseOrderApiSource() {
    return PurchaseOrderSourceImpl(
      Application().appSettings?.securityUrl,
      _myConnectivity,
      token: Application().token,
    );
  }
}
