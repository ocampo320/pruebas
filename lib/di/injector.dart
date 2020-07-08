import 'package:app/di/repository_injector.dart';
import 'package:domain/purchase_order_use_case.dart';
import 'package:domain/security_use_case.dart';

class Injector {
  static Injector _singleton;

  factory Injector() {
    if (_singleton == null) {
      _singleton = Injector._();
    }
    return _singleton;
  }

  Injector._();

  SecurityUseCase provideSecurityUseCase() {
    return SecurityUseCaseImpl(
      RepositoryInjector().provideSecurityRepository(),
    );
  }

  PurchaseOrderUseCase providePurchaseOrderUseCase() {
    return PurchaseOrderUseCaseImpl(
      RepositoryInjector().providePurchaseOrderRepository(),
    );
  }
}
