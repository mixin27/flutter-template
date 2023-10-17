import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:template/src/shared/shared.dart';

part 'error_logger.g.dart';

abstract class ErrorLogger {
  /// * This can be replaced with a call to a crash reporting tool of choice
  void logError(Object error, StackTrace? stackTrace);

  /// * This can be replaced with a call to a crash reporting tool of choice
  void logException(AppException exception);
}

class AppErrorLogger implements ErrorLogger {
  @override
  void logError(Object error, StackTrace? stackTrace) {
    // * This can be replaced with a call to a crash reporting tool of choice
    eLog(error.toString(), error: error, stackTrace: stackTrace);
    flogE('AppErrorLogger', 'logError', '$error');
  }

  @override
  void logException(AppException exception) {
    // * This can be replaced with a call to a crash reporting tool of choice
    eLog(exception.toString());
    flogE('AppErrorLogger', 'logException', exception.toString());
  }
}

@riverpod
ErrorLogger errorLogger(ErrorLoggerRef ref) {
  return AppErrorLogger();
}
