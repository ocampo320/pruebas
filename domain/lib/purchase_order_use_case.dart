import 'package:models/purchase_order_response.dart';
import 'package:models/result.dart';

abstract class PurchaseOrderRepository {
  Future<Result<PurchaseOrderResponse>> getPurchaseOrderListInfo();
}

abstract class PurchaseOrderUseCase {
  Future<Result<PurchaseOrderResponse>> getPurchaseOrderListInfo();
}

class PurchaseOrderUseCaseImpl implements PurchaseOrderUseCase {
  final PurchaseOrderRepository _repository;

  PurchaseOrderUseCaseImpl(this._repository);

  @override
  Future<Result<PurchaseOrderResponse>> getPurchaseOrderListInfo() {
    return _repository.getPurchaseOrderListInfo();
  }
}
