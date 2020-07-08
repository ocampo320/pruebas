import 'package:models/authentication_request.dart';
import 'package:models/authentication_response.dart';
import 'package:models/result.dart';

abstract class SecurityRepository {
  Future<Result<AuthenticationResponse>> login(
      AuthenticationRequest authenticationRequest);

  Future<bool> refreshToken();

  Future saveAuthenticationResponse(
      AuthenticationResponse authenticationResponse);

  Future<AuthenticationResponse> getLocalDataUser();

  Stream<AuthenticationResponse> getDataUser();

  void deleteAllStores();
}

abstract class SecurityUseCase {
  Future<Result<AuthenticationResponse>> login(
      AuthenticationRequest authenticationRequest);

  Future<bool> refreshToken();

  Future<AuthenticationResponse> getLocalDataUser();

  Stream<AuthenticationResponse> getDataUser();

  void deleteAllStores();
}

class SecurityUseCaseImpl implements SecurityUseCase {
  final SecurityRepository _repository;

  SecurityUseCaseImpl(this._repository);

  @override
  Future<Result<AuthenticationResponse>> login(
      AuthenticationRequest authenticationRequest) {
    return _repository.login(authenticationRequest);
  }

  @override
  Future<bool> refreshToken() {
    return _repository.refreshToken();
  }

  @override
  Future<AuthenticationResponse> getLocalDataUser() {
    return _repository.getLocalDataUser();
  }

  @override
  void deleteAllStores() {
    return _repository.deleteAllStores();
  }

  @override
  Stream<AuthenticationResponse> getDataUser() {
    return _repository.getDataUser();
  }
}
