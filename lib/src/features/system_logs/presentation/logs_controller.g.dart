// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logs_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sysLogDirectoryHash() => r'56a36f6ba93098d769ea0e09179db8d66c0074b4';

/// See also [SysLogDirectory].
@ProviderFor(SysLogDirectory)
final sysLogDirectoryProvider = AutoDisposeAsyncNotifierProvider<
    SysLogDirectory, List<FileSystemEntity>>.internal(
  SysLogDirectory.new,
  name: r'sysLogDirectoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sysLogDirectoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SysLogDirectory = AutoDisposeAsyncNotifier<List<FileSystemEntity>>;
String _$appLogsControllerHash() => r'7f5559c99d49ba6edc64bdb72567a85c72877623';

/// See also [AppLogsController].
@ProviderFor(AppLogsController)
final appLogsControllerProvider =
    StreamNotifierProvider<AppLogsController, List<String>>.internal(
  AppLogsController.new,
  name: r'appLogsControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appLogsControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AppLogsController = StreamNotifier<List<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
