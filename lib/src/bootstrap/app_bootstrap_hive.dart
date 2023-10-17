import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'package:template/src/bootstrap/bootstrap.dart';

extension AppBootstrapHive on AppBootstrap {
  /// Setup Hive flutter
  Future<void> setupHive() async {
    final tmpDir = await getTemporaryDirectory();
    await Hive.initFlutter(tmpDir.toString());
  }
}
