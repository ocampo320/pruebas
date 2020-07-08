import 'package:app/blocs/provider/bloc.dart';
import 'package:domain/purchase_order_use_case.dart';

class HomeBloc extends Bloc {
  final PurchaseOrderUseCase _purchaseOrderUseCase;

  HomeBloc(this._purchaseOrderUseCase) {
    _purchaseOrderUseCase.getPurchaseOrderListInfo().then((value) {
      print(value.toString());
    });
  }

  @override
  void dispose() {}
}
