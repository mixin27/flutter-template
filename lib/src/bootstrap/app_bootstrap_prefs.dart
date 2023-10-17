import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:template/src/bootstrap/bootstrap.dart';
import 'package:template/src/shared/shared.dart';

extension AppBootstrapPrefs on AppBootstrap {
  /// Clear flutter secure storage data when old data is present
  /// in iOS after reinstalling the app.
  Future<void> setupSecureStorage() async {
    final prefsBox = await Hive.openBox(Keys.keyPrefs);
    final isFirstTime = prefsBox.get(Keys.keyFirstTime, defaultValue: true);
    if (isFirstTime) {
      const storage = FlutterSecureStorage();
      storage.deleteAll();
      await prefsBox.put(Keys.keyFirstTime, false);
    }
  }
}
