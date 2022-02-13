import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;
  final String apiBaseUrl;




  ApiClient({
    required this.dio,
    required this.apiBaseUrl,
  }) {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (request, handler) {
        // TODO
        return handler.next(request);
      },
    ));

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }


  Future get({
    required String apiPath,
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> queryParameters = const {},
  }) async {
    final response = await dio.get(
      "$apiBaseUrl$apiPath",
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );

    return response.data;
  }

  Future post({
    required String apiPath,
    required dynamic body,
    Map<String, dynamic> headers = const {},
  }) async {
    final response = await dio.post(
      "$apiBaseUrl$apiPath",
      data: body,
      options: Options(
        headers: headers,
      ),
    );


    return response.data;
  }

  Future put({
    required String apiPath,
    required dynamic body,
    Map<String, dynamic> headers = const {},
  }) async {
    final response = await dio.put(
      "$apiBaseUrl$apiPath",
      data: body,
      options: Options(
        headers: headers,
      ),
    );

    return response.data;
  }

  Future delete({
    required String apiPath,
    dynamic body,
    Map<String, dynamic> headers = const {},
  }) async {
    final response = await dio.delete(
      "$apiBaseUrl$apiPath",
      data: body,
      options: Options(
        headers: headers,
      ),
    );

    return response.data;
  }
}