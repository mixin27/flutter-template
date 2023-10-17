// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_date_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentDateBuilderHash() =>
    r'69fac4353662a12b9ee09fd957d940449f74ceda';

/// A provider that returns a function that returns the current date.
/// This makes it easy to mock the current date in tests.
///
/// Copied from [currentDateBuilder].
@ProviderFor(currentDateBuilder)
final currentDateBuilderProvider =
    AutoDisposeProvider<DateTime Function()>.internal(
  currentDateBuilder,
  name: r'currentDateBuilderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentDateBuilderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentDateBuilderRef = AutoDisposeProviderRef<DateTime Function()>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
