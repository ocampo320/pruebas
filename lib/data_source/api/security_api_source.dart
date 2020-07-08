import 'package:app/data_source/api/api_base_source.dart';
import 'package:app/utils/connectivity/my_connectivity.dart';
import 'package:data/security_repository.dart';
import 'package:http/http.dart' as http;
import 'package:models/Command.dart';
import 'package:models/authentication_request.dart';
import 'package:models/authentication_response.dart';
import 'package:models/refresh_token_request.dart';
import 'package:models/refresh_token_response.dart';
import 'package:models/result.dart';

class SecurityApiSourceImpl extends ApiBaseSource implements SecurityApiSource {
  SecurityApiSourceImpl(
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
  Future<Result<AuthenticationResponse>> login(
      AuthenticationRequest authenticationRequest) {
    var command = Command(
      'security.command.user.login',
      getTraceability(),
      authenticationRequest.toJson(),
    );
    var url = 'https://repotestsic.free.beeceptor.com/security/login';
    return post<AuthenticationResponse>(url, command.toJson(), (value) {
      var response = AuthenticationResponse.fromJson(value);
      return response;
    });
  }

  @override
  Future<Result<RefreshTokenResponse>> refreshToken(
      RefreshTokenRequest refreshTokenRequest) async {
    var command = Command(
      'security.command.user.refreshtoken',
      getTraceability(),
      refreshTokenRequest.toJson(),
    );
    var url = 'https://repotestsic.free.beeceptor.com/security/refresh-token';
    return post<RefreshTokenResponse>(url, command.toJson(), (value) {
      var response = RefreshTokenResponse.fromJson(value);
      return response;
    });
  }
}
