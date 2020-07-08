import 'package:app/blocs/provider/bloc.dart';
import 'package:domain/security_use_case.dart';
import 'package:models/authentication_response.dart';
import 'package:rxdart/rxdart.dart';

class ProfileBloc extends Bloc {
  final SecurityUseCase _securityUseCase;

  final BehaviorSubject<AuthenticationResponse> _profileSubject;

  ProfileBloc(this._securityUseCase)
      : _profileSubject = BehaviorSubject<AuthenticationResponse>();

  ValueStream<AuthenticationResponse> get profile => _profileSubject.stream;

  void doLogOut() {
    _securityUseCase.deleteAllStores();
  }

  Stream<AuthenticationResponse> getDataUser() {
    var result = _securityUseCase.getDataUser();
    result.listen((value) {
      if (value != null) {
        _profileSubject.value = value;
      } else {
        print("no hay datos");
      }
    });

    return result;
  }

  @override
  void dispose() {
    _profileSubject.close();
  }
}
