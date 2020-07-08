import 'package:app/blocs/provider/bloc.dart';
import 'package:domain/security_use_case.dart';
import 'package:models/authentication_response.dart';

class SplashBloc extends Bloc {
  final SecurityUseCase _securityUseCase;

  SplashBloc(this._securityUseCase);

  @override
  void dispose() {}

  Future<AuthenticationResponse> getLocalDataUser() {
    return _securityUseCase.getLocalDataUser();
  }

  Future<bool> refreshToken() {
    return _securityUseCase.refreshToken();
  }
}
