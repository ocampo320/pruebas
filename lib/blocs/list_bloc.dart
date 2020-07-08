import 'package:app/blocs/provider/bloc.dart';
import 'package:domain/purchase_order_use_case.dart';
import 'package:models/purchase_order_response.dart';
import 'package:models/result.dart';
import 'package:rxdart/rxdart.dart';

class ListBloc extends Bloc {
  final BehaviorSubject<PurchaseOrderResponse> _dataListSubject;
  final PurchaseOrderUseCase _purchaseOrderUseCase;

  ListBloc(this._purchaseOrderUseCase)
      : _dataListSubject = BehaviorSubject<PurchaseOrderResponse>();

  ValueStream<PurchaseOrderResponse> get dataList => _dataListSubject.stream;

  Stream<Result<PurchaseOrderResponse>> getDataList() {
    var result = _purchaseOrderUseCase.getPurchaseOrderListInfo().asStream();
    result.listen((value) {
      if (value != null) {
        _dataListSubject.value = value.data;
      } else {
        print("no hay datos");
      }
    });
    return result;
  }

  @override
  void dispose() {
    _dataListSubject.close();
  }
}
