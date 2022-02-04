import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nnke/data/models/login_request.dart';
import 'package:nnke/data/models/login_success.dart';
import 'package:nnke/services/dio_http_service.dart';
import 'package:nnke/utils/dio_exceptions.dart';

abstract class AuthRepo {
  Future<LoginSuccess> loginUser(LoginRequest loginRequest);
}

class AuthRepoImpl extends AuthRepo {
  final DioHttpClientService dioHttpClientService;

  AuthRepoImpl(this.dioHttpClientService);

  @override
  Future<LoginSuccess> loginUser(LoginRequest loginRequest) async {
    try {
      var _response = await dioHttpClientService.post('auth/login',
          data: loginRequest.toJson());
      if (_response?.statusCode != 200) {
        throw _response?.data['message'] ?? "Something went wrong";
      }

      return LoginSuccess.fromJson(
          json.decode(json.encode(_response?.data).toString()));
    } on DioError catch (e) {
      throw DioExceptions.fromDioError(e).toString();
    } catch (e) {
      throw e.toString();
    }
  }
}
