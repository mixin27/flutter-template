import 'package:dio/dio.dart';

import 'dio_exception_message.dart';

class DioAppInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Maps custom response
    final responseData = mapResponseData(
      requestOptions: response.requestOptions,
      response: response,
    );

    return handler.resolve(responseData);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Gets custom error message
    final errorMessage = getErrorMessage(err, err.response?.statusCode);

    // Maps custom response
    final responseData = mapResponseData(
      requestOptions: err.requestOptions,
      response: err.response,
      customMessage: errorMessage,
      isErrorResponse: true,
    );

    return handler.resolve(responseData);
  }
}

Response<dynamic> mapResponseData({
  Response<dynamic>? response,
  required RequestOptions requestOptions,
  String customMessage = '',
  bool isErrorResponse = false,
}) {
  final bool hasResponseData = response?.data != null;

  Map<String, dynamic>? responseData = response?.data;

  if (hasResponseData) {
    responseData!.addAll({
      'statusCode': response?.statusCode,
      'statusMessage': response?.statusMessage,
    });
  }

  // AppResponse(
  //   success: isErrorResponse ? false : true,
  //   message: customMessage,
  //   statusCode: response?.statusCode,
  //   statusMessage: response?.statusMessage,
  // ).toJson((value) => null)
  return Response(
    requestOptions: requestOptions,
    data: hasResponseData
        ? responseData
        : {
            'success': isErrorResponse ? false : true,
            'message': customMessage,
            'statusCode': response?.statusCode,
            'statusMessage': response?.statusMessage,
          },
  );
}
