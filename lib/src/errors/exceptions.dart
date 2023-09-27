import 'package:equatable/equatable.dart';

sealed class AppException extends Equatable implements Exception {
  const AppException({required this.code, required this.message});

  final String code;
  final String message;

  @override
  List<Object?> get props => [code, message];

  @override
  String toString() => message;
}
