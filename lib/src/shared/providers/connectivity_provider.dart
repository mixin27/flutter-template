import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:template/src/shared/shared.dart';

part 'connectivity_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<ConnectivityResult> connectivityResult(ConnectivityResultRef ref) {
  return Connectivity().onConnectivityChanged;
}

class ConnectivityService {
  ConnectivityService(this.ref) {
    _init();
  }

  final Ref ref;

  void _init() {
    ref.listen(connectivityResultProvider, (previous, next) {
      final result = next.value;
      dLog('ConnectivityResutl: $result');
    });
  }
}

@Riverpod(keepAlive: true)
ConnectivityService connectivityService(ConnectivityServiceRef ref) {
  return ConnectivityService(ref);
}

enum NetworkStatus {
  connected,
  none,
}

@Riverpod(keepAlive: true)
Stream<NetworkStatus> networkStatus(NetworkStatusRef ref) async* {
  final result = ref.watch(connectivityResultProvider).value;
  final isConnected = await InternetConnectionChecker().hasConnection;

  var status = switch (result) {
    ConnectivityResult.mobile ||
    ConnectivityResult.wifi ||
    ConnectivityResult.ethernet =>
      isConnected ? NetworkStatus.connected : NetworkStatus.none,
    _ => NetworkStatus.none,
  };
  yield* Stream.value(status);
}
