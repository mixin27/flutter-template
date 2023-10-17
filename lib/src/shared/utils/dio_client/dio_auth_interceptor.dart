import 'dart:io';

import 'package:dio/dio.dart';

class DioAuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    const token = 'your-cached-bearer-token';

    // Tries to add Authorization header only if Authorization header
    // not existed
    if (!options.headers.containsKey(HttpHeaders.authorizationHeader)) {
      if (token.isNotEmpty) {
        options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
      }
    }

    return handler.next(options);
  }
}
