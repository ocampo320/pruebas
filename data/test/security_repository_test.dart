import 'package:data/security_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:models/authentication_response.dart';
import 'package:models/authentication_request.dart';
import 'package:models/result.dart';
import 'package:models/refresh_token_request.dart';
import 'package:models/refresh_token_response.dart';

class MockSecurityApiSource extends Mock implements SecurityApiSource {}

class MockSecurityDBSource extends Mock implements SecurityDBSource {}

void main() {
  MockSecurityApiSource _apiSource;
  MockSecurityDBSource _dbSource;
  SecurityRepositoryImpl _repository;

  setUp(() {
    _apiSource = MockSecurityApiSource();
    _dbSource = MockSecurityDBSource();
    _repository = SecurityRepositoryImpl(_apiSource, _dbSource);
  });
  test('saveAuthenticationResponse() should save token in dbSource', () async {
    var response = AuthenticationResponse();
    await _repository.saveAuthenticationResponse(response);
    verify(_dbSource.saveAuthenticationResponse(response));
  });

  test('deleteAll() should delete profile from dbSource', () {
    _dbSource.deleteAllStores();
    verify(_repository.deleteAllStores());
  });

  test('login() should return result from apisoure', () async {
    var request = AuthenticationRequest(user: "", password: "");
    var response = AuthenticationResponse();
    var expected = Result<AuthenticationResponse>.success(response);
    when(_apiSource.login(request)).thenAnswer((_) => Future.value(expected));
    var result = await _repository.login(request);
    verify(_apiSource.login(request));
    verify(_dbSource.saveAuthenticationResponse(response));
    expect(result.status, Status.success);
    expect(result, expected);
  });

  test('getLocalDataUser() should to return result from dbsource', () async {
    var expected = AuthenticationResponse();
    when(_dbSource.getLocalDataUser())
        .thenAnswer((_) => Future.value(expected));

    var result = await _repository.getLocalDataUser();

    verify(_dbSource.getLocalDataUser());
    expect(result, expected);
  });

  test('getDataUser() should to return result from dbsource', () async {
    var expected = AuthenticationResponse();
    when(_dbSource.getLocalDataUser())
        .thenAnswer((_) => Future.value(expected));

    var result = await _repository.getLocalDataUser();

    verify(_dbSource.getLocalDataUser());
    expect(result, expected);
  });

  test("refreshToken()", () async {
    var response = RefreshTokenResponse();
    var expected = Result<RefreshTokenResponse>.success(response);
    var request = RefreshTokenRequest(token: "");
    when(_apiSource.refreshToken(request))
        .thenAnswer((_) => Future.value(expected));

    var result = await _repository.refreshToken();
    verify(_apiSource.refreshToken(request));
    expect(result, expected);
  });
}
