import 'package:data/purchase_order_repository.dart';
import 'package:data/security_repository.dart';
import 'package:domain/purchase_order_use_case.dart';
import 'package:domain/security_use_case.dart';

import 'data_source_injector.dart';

class RepositoryInjector {
  static RepositoryInjector _singleton;

  factory RepositoryInjector() {
    if (_singleton == null) {
      _singleton = RepositoryInjector._();
    }
    return _singleton;
  }

  RepositoryInjector._();

  SecurityRepository provideSecurityRepository() {
    return SecurityRepositoryImpl(
      DataSourceInjector().provideSecurityApiSource(),
      DataSourceInjector().provideSecurityDBSource(),
    );
  }

  PurchaseOrderRepository providePurchaseOrderRepository() {
    return PurchaseOrderRepositoryImpl(
      DataSourceInjector().providePurchaseOrderApiSource(),
    );
  }
}
