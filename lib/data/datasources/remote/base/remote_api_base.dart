import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:trivia_app/core/constants/index.dart';
import 'package:trivia_app/core/utils/index.dart';
import 'package:trivia_app/data/models/presenters/index.dart';
import 'dart:convert';

class RemoteApiBase {
  final http.Client client;
  final Connectivity connectivity;

  RemoteApiBase(this.client, this.connectivity);

  Future<RemoteResultApi<T>> getApi<T>(
      String baseUrl, String unencodedPath, T Function(dynamic value) mapper,
      {Map<String, String>? headers,
      Map<String, dynamic>? queryParameters}) async {
    final bool isConnected = await connectivity.isConnected();
    if (!isConnected) {
      return ErrorResultApi<T>(errorMessage: AppStrings.errorNoInternet);
    }
    final response = await client
        .get(
          Uri.https(baseUrl, unencodedPath, queryParameters),
          headers: headers,
        )
        .timeout(AppStrings.apiTimeOut);
      
    return _manageResponse(response, mapper);
  }

  Future<RemoteResultApi<T>> postApi<T>(String baseUrl, String unencodedPath,
      Map<String, String>? body, T Function(dynamic value) mapper,
      {Map<String, String>? headers,
      Map<String, dynamic>? queryParameters}) async {
    final bool isConnected = await connectivity.isConnected();
    if (!isConnected) {
      return ErrorResultApi<T>(errorMessage: AppStrings.errorNoInternet);
    }
    final response = await client
        .post(Uri.https(baseUrl, unencodedPath, queryParameters),
            body: body, headers: headers)
        .timeout(AppStrings.apiTimeOut);
    return _manageResponse(response, mapper);
  }

  RemoteResultApi<T> _manageResponse<T>(
    http.Response response,
    T Function(dynamic value) mapper,
  ) {
    _logResponse(response);

    if (response.statusCode == 200) {
      T? mapperModel;
      mapperModel = mapper(response.body);
      return SuccesResultApi<T>(data: mapperModel);
    } else {
      return ErrorResultApi<T>(errorMessage: AppStrings.errorApiGeneral);
    }
  }
}

void _logResponse(http.Response response) {
  final data = json.decode(response.body);
  final prettyBody = const JsonEncoder.withIndent(" ").convert(data);
  log(response.request!.url.toString(), name: "URL");
  log(response.request!.method.toString(), name: "METHOD");
  log(response.request!.headers.toString(), name: "HEADERS");
  log(response.statusCode.toString(), name: "STATUS");
  log(prettyBody, name: "[BODY]");
}
