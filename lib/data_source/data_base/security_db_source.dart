import 'package:data/security_repository.dart';
import 'package:models/authentication_response.dart';
import 'package:models/refresh_token_response.dart';
import 'package:sembast/sembast.dart';

import 'app_database.dart';

class SecurityDBSourceImpl implements SecurityDBSource {
  static SecurityDBSourceImpl _singleton;

  factory SecurityDBSourceImpl() {
    if (_singleton == null) {
      _singleton = SecurityDBSourceImpl._();
    }
    return _singleton;
  }

  SecurityDBSourceImpl._();

  final String _authenticationResponse = '_authenticationResponse';

  Future<Database> get _sdb async => await AppDatabase().securityDatabase;

  Future<Database> get _db async => await AppDatabase().database;

  @override
  Future saveAuthenticationResponse(
      AuthenticationResponse authenticationResponse) async {
    var store = StoreRef.main();
    await store
        .record(_authenticationResponse)
        .put(await _sdb, authenticationResponse.toJson());
  }

  @override
  Future<AuthenticationResponse> getLocalDataUser() async {
    var store = StoreRef.main();
    var data = await store.record(_authenticationResponse).get(await _sdb)
        as Map<String, dynamic>;
    return (data == null) ? null : AuthenticationResponse.fromJson(data);
  }

  @override
  void deleteAllStores() async {
    var store = StoreRef.main();
    print(_sdb);
    store.drop(await _db);
    store.drop(await _sdb);
  }

  @override
  Future<AuthenticationResponse> getDataUser() async {
    var store = StoreRef.main();
    var data = store.record(_authenticationResponse).get(await _sdb)
        as Map<String, dynamic>;
    return (data == null) ? null : AuthenticationResponse.fromJson(data);
  }

  @override
  Future<bool> updateTokeUser(RefreshTokenResponse refreshTokenResponse) {
    return getLocalDataUser().then((value) {
      value.token = refreshTokenResponse.token;
      return saveAuthenticationResponse(value).then((_) {
        if (value != null) {
          return Future.value(true);
        } else {
          return Future.value(false);
        }
      });
    });
  }
}
