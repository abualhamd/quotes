import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:flutter/foundation.dart';
import 'package:quotes/core/api/app_interceptors.dart';
import 'package:quotes/core/api/end_points.dart';
import 'api_consumer.dart';
import 'package:dio/dio.dart';
import 'package:quotes/core/error/exceptions.dart';
import 'status_codes.dart';
import 'package:quotes/injection_container.dart' as di;

class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    client.options = BaseOptions(
      // headers: {'connection': 'keep-alive'},
      baseUrl: EndPoints.baseUrl,
      followRedirects: false,
      validateStatus: (status) {
        return status! < StatusCodes.internalServerError;
      },
      // connectTimeout: 2,
    );

    client.interceptors.add(di.sl<AppInterceptors>());
    if (kDebugMode) {
      client.interceptors.add(di.sl<LogInterceptor>());
    }
  }

  @override
  Future get(
      {required String path, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.get(path, queryParameters: queryParameters);
      return response.data;
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future post(
      {required String path,
      required Map<String, dynamic> body,
      bool formDataEnabled = false,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.post(path,
          data: formDataEnabled ? FormData.fromMap(body) : body,
          queryParameters: queryParameters);
      return response.data;
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future put(
      {required String path,
      required Map<String, dynamic> body,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await client.post(path, data: body, queryParameters: queryParameters);
      return response.data;
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  dynamic _handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw const FetchDataException();
      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case StatusCodes.unauthorized:
          case StatusCodes.forbidden:
            throw const UnauthorizedException();
          case StatusCodes.notFound:
            throw const NotFoundException();
          case StatusCodes.conflict:
            throw const ConflictException();

          case StatusCodes.internalServerError:
            throw const InternalServerErrorException();
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw const NoInternetConnectionException();
    }
  }
}
