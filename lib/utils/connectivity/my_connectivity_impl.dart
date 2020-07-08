import 'package:app/utils/connectivity/my_connectivity.dart';
import 'package:connectivity/connectivity.dart';

class MyConnectivityImpl implements MyConnectivity {
  @override
  Future<ConnectivityResult> checkConnectivity() async {
    return Connectivity().checkConnectivity();
  }
}
