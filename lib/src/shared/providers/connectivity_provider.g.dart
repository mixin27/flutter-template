// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$connectivityResultHash() =>
    r'34f79c10dc74af4835b2cdc8757a94a959409586';

/// See also [connectivityResult].
@ProviderFor(connectivityResult)
final connectivityResultProvider = StreamProvider<ConnectivityResult>.internal(
  connectivityResult,
  name: r'connectivityResultProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$connectivityResultHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ConnectivityResultRef = StreamProviderRef<ConnectivityResult>;
String _$connectivityServiceHash() =>
    r'9f520449d4c14eebb03a41cb15bf2610ae1cb7f1';

/// See also [connectivityService].
@ProviderFor(connectivityService)
final connectivityServiceProvider = Provider<ConnectivityService>.internal(
  connectivityService,
  name: r'connectivityServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$connectivityServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ConnectivityServiceRef = ProviderRef<ConnectivityService>;
String _$networkStatusHash() => r'a6b2d15b288611dd5426c8059c95f29df5b65ded';

/// See also [networkStatus].
@ProviderFor(networkStatus)
final networkStatusProvider = StreamProvider<NetworkStatus>.internal(
  networkStatus,
  name: r'networkStatusProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$networkStatusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NetworkStatusRef = StreamProviderRef<NetworkStatus>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
