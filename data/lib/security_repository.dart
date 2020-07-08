import 'dart:async';

import 'package:domain/security_use_case.dart';
import 'package:models/authentication_request.dart';
import 'package:models/authentication_response.dart';
import 'package:models/refresh_token_request.dart';
import 'package:models/refresh_token_response.dart';
import 'package:models/result.dart';

abstract class SecurityApiSource {
  Future<Result<AuthenticationResponse>> login(
      AuthenticationRequest authenticationRequest);

  Future<Result<RefreshTokenResponse>> refreshToken(
      RefreshTokenRequest refreshTokenRequest);
}

abstract class SecurityDBSource {
  Future saveAuthenticationResponse(
      AuthenticationResponse authenticationResponse);

  Future<AuthenticationResponse> getLocalDataUser();

  void deleteAllStores();

  Future<bool> updateTokeUser(RefreshTokenResponse refreshTokenResponse);
}

class SecurityRepositoryImpl implements SecurityRepository {
  final SecurityApiSource _apiSource;
  final SecurityDBSource _dbSource;

  SecurityRepositoryImpl(this._apiSource, this._dbSource);

  @override
  Future<Result<AuthenticationResponse>> login(
      AuthenticationRequest authenticationRequest) {
    return _apiSource.login(authenticationRequest).then((result) {
      if (result.status == Status.success) {
        return _dbSource.saveAuthenticationResponse(result.data).then((_) {
          return Future.value(result);
        });
      }
      return Future.value(result);
    });
  }

  @override
  Future saveAuthenticationResponse(
      AuthenticationResponse authenticationResponse) {
    return _dbSource.saveAuthenticationResponse(authenticationResponse);
  }

  @override
  Future<bool> refreshToken() {
    return _dbSource.getLocalDataUser().then((value) {
      return _apiSource
          .refreshToken(RefreshTokenRequest(token: value.token))
          .then((result) {
        if (result.status == Status.success) {
          return _dbSource.updateTokeUser(result.data);
        }
        return Future.value(false);
      });
    });
  }

  @override
  Stream<AuthenticationResponse> getDataUser() {
    StreamController<AuthenticationResponse> controller = StreamController();
    _dbSource.getLocalDataUser().then((value) async {
      controller.add(value);
      await controller.close();
    });
    return controller.stream;
  }

  @override
  void deleteAllStores() {
    return _dbSource.deleteAllStores();
  }

  @override
  Future<AuthenticationResponse> getLocalDataUser() {
    return _dbSource.getLocalDataUser();
  }
}
