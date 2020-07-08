import 'package:app/blocs/login_bloc.dart';
import 'package:domain/security_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockSecurityUseCase extends Mock implements SecurityUseCase {}

void main() {
  MockSecurityUseCase _securityUseCase;
  LoginBloc _bloc;

  setUp(() {
    _securityUseCase = MockSecurityUseCase();
    _bloc = LoginBloc(_securityUseCase);
  });
}
