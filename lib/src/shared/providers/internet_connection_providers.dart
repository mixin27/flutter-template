import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'internet_connection_providers.g.dart';

Future<bool> checkConnection() => InternetConnectionChecker().hasConnection;

@riverpod
FutureOr<bool> hasInternetConnection(HasInternetConnectionRef ref) {
  return InternetConnectionChecker().hasConnection;
}
