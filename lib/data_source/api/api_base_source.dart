import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:app/utils/connectivity/my_connectivity.dart';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;
import 'package:models/localization_constants.dart';
import 'package:models/result.dart';
import 'package:uuid/uuid.dart';

class ApiBaseSource {
  final String baseUrl;
  final http.Client client;
  final MyConnectivity connectivity;
  final String token;

  final Duration timeout = Duration(seconds: 30);

  ApiBaseSource(this.baseUrl, this.client, this.connectivity, this.token);

  Future<Result<T>> get<T>(String url, T Function(dynamic value) mapperFunction,
      {Map<String, String> headers}) async {
    try {
      var connectivityResult = await connectivity.checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        return Result<T>.error(message: L10NConstants.internetNotAvailable);
      }
      headers = await getHeaders(headers);
      headers[HttpHeaders.contentTypeHeader] = 'application/json';
      headers[HttpHeaders.acceptHeader] = 'application/json';
      log(url, name: 'url');
      log('GET', name: 'method');
      log(headers.toString(), name: 'headers');
      var response = await client.get(url, headers: headers).timeout(timeout);
      return await _manageResponse(response, mapperFunction);
    } catch (ex) {
      log(ex.toString(), name: 'error');
      return Result<T>.error(message: L10NConstants.defaultError);
    }
  }

  Future<Result<T>> post<T>(String url, Map<String, dynamic> body,
      T Function(dynamic value) mapperFunction,
      {Map<String, String> headers}) async {
    try {
      var connectivityResult = await connectivity.checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        return Result<T>.error(message: L10NConstants.internetNotAvailable);
      }
      headers = await getHeaders(headers);
      headers[HttpHeaders.contentTypeHeader] = 'application/json';
      headers[HttpHeaders.acceptHeader] = 'application/json';
      log(url, name: 'url');
      log('POST', name: 'method');
      log(headers.toString(), name: 'headers');
      log(json.encode(body), name: 'requestBody');
      var response = await client
          .post(url, body: json.encode(body), headers: headers)
          .timeout(timeout);
      return await _manageResponse(response, mapperFunction);
    } catch (ex) {
      log(ex.toString(), name: 'error');
      return Result<T>.error(message: L10NConstants.defaultError);
    }
  }

  Map<String, String> getTraceability() {
    var traceability = <String, String>{};
    traceability['appId'] = '3449cef5-0762-4d73-bd55-31978f31e543';
    traceability['appName'] = Platform.isAndroid ? 'android' : 'ios';
    traceability['source'] = Platform.isAndroid ? 'android' : 'ios';
    traceability['transactionId'] = Uuid().v1();
    //   traceability['version'] = Application().appVersion;
    return traceability;
  }

  Future<Result<T>> _manageResponse<T>(
      http.Response response, T Function(dynamic value) mapperFunction) async {
    log(response.statusCode.toString(), name: 'statusCode');
    log(response.body, name: 'responseBody');
    if (response.statusCode == 200) {
      return Result<T>.success(mapperFunction(_getBody(response.bodyBytes)));
    } else {
      return _manageError<T>(response);
    }
  }

  Result<T> _manageError<T>(http.Response response) {
    if (response.statusCode >= 500) {
      return Result<T>.error(message: L10NConstants.defaultError);
    } else if (response.statusCode == 401) {
      //  Application().logoutController.add(true);
      return Result<T>.error(message: L10NConstants.defaultError);
    } else {
      return _errorFromMap(response);
    }
  }

  Result<T> _errorFromMap<T>(http.Response response) {
    try {
      Map<String, dynamic> body = jsonDecode(response.body);
      String description = body['description'];
      description = description ?? L10NConstants.defaultError;
      int code = body.containsKey('code') ? body['code'] : 0;
      return Result<T>.error(message: description, code: code);
    } catch (ex) {
      log(ex.toString(), name: 'error');
      return Result<T>.error(
          message: L10NConstants.defaultError, code: response.statusCode);
    }
  }

  dynamic _getBody(body) {
    var bodyString = utf8.decode(body);
    try {
      return json.decode(bodyString);
    } catch (ex) {
      log(ex.toString(), name: 'error');
      return bodyString;
    }
  }

  Future<Map<String, String>> getHeaders(Map<String, String> headers) async {
    headers = headers ?? {};
    headers = await loadToken(headers);
    return headers;
  }

  Future<Map<String, String>> loadToken(Map<String, String> headers) async {
    if (token != null) {
      log(token, name: 'token');
      headers[HttpHeaders.authorizationHeader] = token;
    }
    return headers;
  }
}
