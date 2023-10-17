import 'package:flutter/material.dart';

import 'package:template/src/bootstrap/bootstrap.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // create an app bootstrap instance
  final appBootstrap = AppBootstrap();

  // setup flutter_logs
  await appBootstrap.setupFlutterLogs();

  // init Hive flutter
  await appBootstrap.setupHive();

  // clear cached FlutterSecureStorage data for the first time
  await appBootstrap.setupSecureStorage();

  // other setups here
  // ...

  // create a container configured with all the required repositories
  final container = await appBootstrap.createMainProviderContainer();

  appBootstrap.listenLogsContent(container);
  // appBootstrap.listenNetworkStateService(container);
  // other setups with contaienr here
  // ...

  // use the container above to create the root widget
  final root = appBootstrap.createRootWidget(container: container);

  // start the app
  runApp(root);
}
