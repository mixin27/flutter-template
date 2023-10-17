// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_status_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$networkStateServiceHash() =>
    r'd6ab79273b920f9bca88d667d3318875cc55f9c3';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [networkStateService].
@ProviderFor(networkStateService)
const networkStateServiceProvider = NetworkStateServiceFamily();

/// See also [networkStateService].
class NetworkStateServiceFamily extends Family<NetworkStatusService> {
  /// See also [networkStateService].
  const NetworkStateServiceFamily();

  /// See also [networkStateService].
  NetworkStateServiceProvider call(
    BuildContext context,
  ) {
    return NetworkStateServiceProvider(
      context,
    );
  }

  @override
  NetworkStateServiceProvider getProviderOverride(
    covariant NetworkStateServiceProvider provider,
  ) {
    return call(
      provider.context,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'networkStateServiceProvider';
}

/// See also [networkStateService].
class NetworkStateServiceProvider extends Provider<NetworkStatusService> {
  /// See also [networkStateService].
  NetworkStateServiceProvider(
    BuildContext context,
  ) : this._internal(
          (ref) => networkStateService(
            ref as NetworkStateServiceRef,
            context,
          ),
          from: networkStateServiceProvider,
          name: r'networkStateServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$networkStateServiceHash,
          dependencies: NetworkStateServiceFamily._dependencies,
          allTransitiveDependencies:
              NetworkStateServiceFamily._allTransitiveDependencies,
          context: context,
        );

  NetworkStateServiceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.context,
  }) : super.internal();

  final BuildContext context;

  @override
  Override overrideWith(
    NetworkStatusService Function(NetworkStateServiceRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NetworkStateServiceProvider._internal(
        (ref) => create(ref as NetworkStateServiceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        context: context,
      ),
    );
  }

  @override
  ProviderElement<NetworkStatusService> createElement() {
    return _NetworkStateServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NetworkStateServiceProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin NetworkStateServiceRef on ProviderRef<NetworkStatusService> {
  /// The parameter `context` of this provider.
  BuildContext get context;
}

class _NetworkStateServiceProviderElement
    extends ProviderElement<NetworkStatusService> with NetworkStateServiceRef {
  _NetworkStateServiceProviderElement(super.provider);

  @override
  BuildContext get context => (origin as NetworkStateServiceProvider).context;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
