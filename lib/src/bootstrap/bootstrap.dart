import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:template/src/features/authentication/authentication.dart';
import 'package:template/src/shared/shared.dart';
import 'bootstrap.dart';

export 'app_bootstrap.dart';
export 'app_bootstrap_hive.dart';
export 'app_bootstrap_prefs.dart';
export 'app_bootstrap_logger.dart';

/// Extension methods specific for the main project configuration
extension AppBootstrapMain on AppBootstrap {
  /// Creates the top-level [ProviderContainer] by overriding providers with fake
  /// repositories only. This is useful for testing purposes and for running the
  /// app with a "fake" backend.
  ///
  /// Note: all repositories needed by the app can be accessed via providers.
  /// Some of these providers throw an [UnimplementedError] by default.
  ///
  /// Example:
  /// ```dart
  /// @Riverpod(keepAlive: true)
  /// LocalCartRepository localCartRepository(LocalCartRepositoryRef ref) {
  ///   throw UnimplementedError();
  /// }
  /// ```
  ///
  /// As a result, this method does two things:
  /// - create and configure the repositories as desired
  /// - override the default implementations with a list of "overrides"
  Future<ProviderContainer> createMainProviderContainer({
    bool addDelay = true,
  }) async {
    // SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    final localAuthRepository = SecureStorageLocalAuthRepository.makeDefault();

    final container = ProviderContainer(
      overrides: [
        // common
        sharedPrefsProvider.overrideWithValue(prefs),
        // repositories
        localAuthRepositoryProvider.overrideWithValue(localAuthRepository),
        // services
      ],
      observers: [AsyncErrorLogger()],
    );

    return container;
  }
}
