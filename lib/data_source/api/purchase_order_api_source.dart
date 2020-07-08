import 'package:app/data_source/api/api_base_source.dart';
import 'package:app/utils/connectivity/my_connectivity.dart';
import 'package:data/purchase_order_repository.dart';
import 'package:http/http.dart' as http;
import 'package:models/purchase_order_response.dart';
import 'package:models/result.dart';

class PurchaseOrderSourceImpl extends ApiBaseSource
    implements PurchaseOrderApiSource {
  PurchaseOrderSourceImpl(
    String baseUrl,
    MyConnectivity connectivity, {
    http.Client client,
    String token,
  }) : super(
          baseUrl,
          client ?? http.Client(),
          connectivity,
          token,
        );

  @override
  Future<Result<PurchaseOrderResponse>> getPurchaseOrderListInfo() {
    var url = 'https://repotestsic.free.beeceptor.com/order-service/list-home';
    return get<PurchaseOrderResponse>(url, (value) {
      return PurchaseOrderResponse.fromJson(value);
    });
  }
}
