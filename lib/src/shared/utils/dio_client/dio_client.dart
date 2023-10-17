import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:template/src/env/env.dart';
import 'package:template/src/shared/utils/dio_client/dio_auth_interceptor.dart';

part 'dio_client.g.dart';

class DioClient {
  factory DioClient() {
    return _instance ??= DioClient._private();
  }

  DioClient._private() {
    _dio = createDioClient();
  }

  static DioClient? _instance;
  static late Dio _dio;
  Dio get instance => _dio;

  Dio createDioClient() {
    final baseUrl = Env.getApiUrl(Flavor.development);
    final dio = Dio()
      ..options = BaseOptions(
        baseUrl: baseUrl,
        headers: {
          Headers.acceptHeader: Headers.jsonContentType,
          Headers.contentTypeHeader: Headers.jsonContentType,
        },
      )
      // interceptors here
      ..interceptors.addAll([
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
        DioAuthInterceptor(),
        DioAuthInterceptor(),
      ]);

    return dio;
  }
}

@riverpod
Dio defaultDioClient(DefaultDioClientRef ref) {
  return DioClient().instance;
}
