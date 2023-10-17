import 'package:dio/dio.dart';
import 'package:template/src/features/authentication/authentication.dart';
import 'package:template/src/shared/utils/dio_client/dio_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_auth_repository.g.dart';

class DioAuthRepository implements RemoteAuthRepository {
  DioAuthRepository({
    Dio? dioClient,
  }) : _httpClient = dioClient ??= DioClient().instance;

  // ignore: unused_field
  final Dio _httpClient;

  @override
  Future<void> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    throw UnimplementedError();
  }
}

@riverpod
RemoteAuthRepository dioAuthRepository(DioAuthRepositoryRef ref) {
  return DioAuthRepository();
}
