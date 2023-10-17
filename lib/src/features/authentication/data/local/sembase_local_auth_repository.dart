import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';

import 'package:template/src/features/authentication/authentication.dart';
import 'package:sembast/sembast_io.dart';

class SembaseLocalAuthRepository implements LocalAuthRepository {
  SembaseLocalAuthRepository(this.db);

  final Database db;

  final store = StoreRef.main();

  static Future<Database> createDatabase(String fileName) async {
    if (!kIsWeb) {
      final appDocDir = await getApplicationDocumentsDirectory();
      return databaseFactoryIo.openDatabase('${appDocDir.path}/$fileName');
    } else {
      throw Exception('Android and iOS are only supported.');
    }
  }

  static Future<SembaseLocalAuthRepository> makeDefault() async {
    return SembaseLocalAuthRepository(await createDatabase('default.db'));
  }

  static const authKey = 'auth_info';

  @override
  Future<User?> fetchUser() async {
    final userJson = await store.record(authKey).get(db) as String?;
    return userJson != null ? User.fromJson(jsonDecode(userJson)) : null;
  }

  @override
  Future<void> setUser(User user) {
    return store.record(authKey).put(db, jsonEncode(user.toJson()));
  }

  @override
  Stream<User?> watchUser() {
    final record = store.record(authKey);
    return record.onSnapshot(db).map((snapshot) {
      return snapshot != null
          ? User.fromJson(jsonDecode(snapshot.value as String))
          : null;
    });
  }
}
