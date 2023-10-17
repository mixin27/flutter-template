import 'dart:convert';

import 'package:template/src/features/authentication/data/local/local_auth_repository.dart';
import 'package:template/src/features/authentication/data/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageLocalAuthRepository implements LocalAuthRepository {
  SecureStorageLocalAuthRepository(this._secureStorage);

  final FlutterSecureStorage _secureStorage;

  static SecureStorageLocalAuthRepository makeDefault() {
    return SecureStorageLocalAuthRepository(const FlutterSecureStorage());
  }

  static const _key = 'oauth2_credentials';
  User? _cachedUser;

  @override
  Future<User?> fetchUser() async {
    if (_cachedUser != null) {
      return _cachedUser;
    }

    final userJson = await _secureStorage.read(key: _key);
    return userJson != null ? User.fromJson(jsonDecode(userJson)) : null;
  }

  @override
  Future<void> setUser(User user) {
    _cachedUser = user;
    return _secureStorage.write(key: _key, value: jsonEncode(user.toJson()));
  }

  @override
  Stream<User?> watchUser() {
    throw UnimplementedError();
  }

  Future<void> clear() async {
    _cachedUser = null;
    return _secureStorage.delete(key: _key);
  }
}
