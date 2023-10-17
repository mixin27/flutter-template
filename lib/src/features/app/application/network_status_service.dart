import 'package:template/src/l10n/string_hardcoded.dart';
import 'package:template/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_status_service.g.dart';

class NetworkStatusService {
  NetworkStatusService(this.ref, this.context) {
    _init();
  }

  final Ref ref;
  final BuildContext context;

  _init() {
    ref.listen(networkStatusProvider.select((value) => value.value),
        (previous, next) {
      if (previous == NetworkStatus.none && next == NetworkStatus.connected) {
        flogI(
          'NetworkStatusService',
          'network status',
          'Internet connection has been restored.',
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Great! Your internet connection has been restored.'.hardcoded,
            ),
          ),
        );
        // ScaffoldMessenger.of(context).showMaterialBanner(
        //   MaterialBanner(
        //     content: Text(switch (next) {
        //       NetworkStatus.connected =>
        //         'Great! Your internet connection has been restored.',
        //       _ => 'Oppos! Internet connection has been lost.',
        //     }),
        //     actions: [
        //       TextButton(
        //         onPressed: () =>
        //             ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
        //         child: Text('Ok'.hardcoded),
        //       ),
        //     ],
        //   ),
        // );
      } else if (previous == NetworkStatus.connected &&
          next == NetworkStatus.none) {
        flogI(
          'NetworkStatusService',
          'network status',
          'Internet connection has been lost.',
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('No internet connection.'.hardcoded),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Settings'.hardcoded),
                ),
              ],
            ),
          ),
        );
        // ScaffoldMessenger.of(context).showMaterialBanner(
        //   MaterialBanner(
        //     content: Text(switch (next) {
        //       NetworkStatus.connected =>
        //         'Great! Your internet connection has been restored.',
        //       _ => 'Oppos! Internet connection has been lost.',
        //     }),
        //     actions: [
        //       TextButton(
        //         onPressed: () =>
        //             ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
        //         child: Text('Ok'.hardcoded),
        //       ),
        //     ],
        //   ),
        // );
      }
    });
  }
}

@Riverpod(keepAlive: true)
NetworkStatusService networkStateService(
  NetworkStateServiceRef ref,
  BuildContext context,
) {
  return NetworkStatusService(ref, context);
}
