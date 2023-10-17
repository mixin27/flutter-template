import 'package:template/src/features/authentication/authentication.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_auth_repository.g.dart';

abstract class LocalAuthRepository {
  Future<User?> fetchUser();

  Stream<User?> watchUser();

  Future<void> setUser(User user);
}

@Riverpod(keepAlive: true)
LocalAuthRepository localAuthRepository(LocalAuthRepositoryRef ref) {
  throw UnimplementedError();
}
