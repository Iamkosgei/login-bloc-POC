import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const _defaultConnectTimeout = Duration.millisecondsPerMinute;
const _defaultReceiveTimeout = Duration.millisecondsPerMinute;

class DioHttpClientService {
  final String baseUrl;

  Dio? _dio;

  final List<Interceptor> interceptors;

  DioHttpClientService(
    this.baseUrl,
    Dio dio, {
    required this.interceptors,
  }) {
    _dio = dio;
    _dio
      ?..options.baseUrl = baseUrl
      ..options.connectTimeout = _defaultConnectTimeout
      ..options.receiveTimeout = _defaultReceiveTimeout
      ..httpClientAdapter
      ..options.headers = {'Content-Type': 'application/json; charset=UTF-8'};
    if (interceptors.isNotEmpty) {
      _dio?.interceptors.addAll(interceptors);
    }

    if (kDebugMode) {
      _dio?.interceptors.add(PrettyDioLogger(
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: true,
          request: true,
          requestBody: true));
    }
  }

  Future<Response?> post(
    String uri, {
    data,
  }) async {
    try {
      var response = await _dio?.post(
        uri,
        data: data,
      );

      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
}
