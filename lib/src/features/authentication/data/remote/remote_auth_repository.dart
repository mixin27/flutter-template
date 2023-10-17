import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remote_auth_repository.g.dart';

/// Remote authentication repository contracts
abstract class RemoteAuthRepository {
  Future<void> signInWithEmailAndPassword(String email, String password);

  Future<void> createUserWithEmailAndPassword(String email, String password);
}

@Riverpod(keepAlive: true)
RemoteAuthRepository remoteAuthRepository(RemoteAuthRepositoryRef ref) {
  throw UnimplementedError();
}
