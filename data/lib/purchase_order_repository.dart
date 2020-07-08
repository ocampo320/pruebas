import 'package:domain/purchase_order_use_case.dart';
import 'package:models/purchase_order_response.dart';
import 'package:models/result.dart';

abstract class PurchaseOrderApiSource {
  Future<Result<PurchaseOrderResponse>> getPurchaseOrderListInfo();
}

class PurchaseOrderRepositoryImpl implements PurchaseOrderRepository {
  final PurchaseOrderApiSource _apiSource;

  PurchaseOrderRepositoryImpl(this._apiSource);

  @override
  Future<Result<PurchaseOrderResponse>> getPurchaseOrderListInfo() {
    return _apiSource.getPurchaseOrderListInfo();
  }
}
