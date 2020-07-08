import 'dart:async';

import 'package:domain/security_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:models/authentication_request.dart';
import 'package:models/authentication_response.dart';
import 'package:models/result.dart';

class MockSecurityRepository extends Mock implements SecurityRepository {}

void main() {
  MockSecurityRepository _repository;
  SecurityUseCaseImpl _useCase;

  setUp(() {
    _repository = MockSecurityRepository();
    _useCase = SecurityUseCaseImpl(_repository);
  });

  test('login() should return result from repository', () async {
    var request = AuthenticationRequest(user: "", password: "");
    var response = AuthenticationResponse();
    var expected = Result<AuthenticationResponse>.success(response);
    when(_repository.login(request)).thenAnswer((_) => Future.value(expected));
    var result = await _useCase.login(request);
    verify(_repository.login(request));
    expect(result, expected);
    expect(result.data, response);
    expect(result.status, Status.success);
  });

  test('getProfile() should return result from repository', () async {
    var expected = AuthenticationResponse();
    var controller = StreamController<AuthenticationResponse>.broadcast();
    when(_repository.getDataUser()).thenAnswer((_) => controller.stream);
    var result = _useCase.getDataUser();
    verify(_repository.getDataUser());
    result.listen(expectAsync1((result) {
      expect(result, expected);
      controller.close();
    }));
    controller.add(expected);
  });

  test('deleteProfile() should delete profile from repository', () {
    _useCase.deleteAllStores();
    verify(_repository.deleteAllStores());
  });

  test('getLocalDataUser() should return result from repository', () async {
    var expected = AuthenticationResponse();
    when(_repository.getLocalDataUser())
        .thenAnswer((_) => Future.value(expected));
    var result = await _useCase.getLocalDataUser();
    verify(_repository.getLocalDataUser());
    expect(result, expected);
  });

  test('refreshToken() should return result from repository', () async {
    var expected = true;
    when(_repository.refreshToken()).thenAnswer((_) => Future.value(expected));
    var result = await _useCase.refreshToken();
    verify(_repository.refreshToken());
    expect(result, expected);
  });
}
