// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'formatter_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$formatDateHash() => r'71c66a8698a3cfa1040753c3253665793524ec08';

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

/// See also [formatDate].
@ProviderFor(formatDate)
const formatDateProvider = FormatDateFamily();

/// See also [formatDate].
class FormatDateFamily extends Family<DateFormat> {
  /// See also [formatDate].
  const FormatDateFamily();

  /// See also [formatDate].
  FormatDateProvider call({
    String pattern = 'dd-MM-yyyy',
  }) {
    return FormatDateProvider(
      pattern: pattern,
    );
  }

  @override
  FormatDateProvider getProviderOverride(
    covariant FormatDateProvider provider,
  ) {
    return call(
      pattern: provider.pattern,
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
  String? get name => r'formatDateProvider';
}

/// See also [formatDate].
class FormatDateProvider extends AutoDisposeProvider<DateFormat> {
  /// See also [formatDate].
  FormatDateProvider({
    String pattern = 'dd-MM-yyyy',
  }) : this._internal(
          (ref) => formatDate(
            ref as FormatDateRef,
            pattern: pattern,
          ),
          from: formatDateProvider,
          name: r'formatDateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$formatDateHash,
          dependencies: FormatDateFamily._dependencies,
          allTransitiveDependencies:
              FormatDateFamily._allTransitiveDependencies,
          pattern: pattern,
        );

  FormatDateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pattern,
  }) : super.internal();

  final String pattern;

  @override
  Override overrideWith(
    DateFormat Function(FormatDateRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FormatDateProvider._internal(
        (ref) => create(ref as FormatDateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pattern: pattern,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<DateFormat> createElement() {
    return _FormatDateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FormatDateProvider && other.pattern == pattern;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pattern.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FormatDateRef on AutoDisposeProviderRef<DateFormat> {
  /// The parameter `pattern` of this provider.
  String get pattern;
}

class _FormatDateProviderElement extends AutoDisposeProviderElement<DateFormat>
    with FormatDateRef {
  _FormatDateProviderElement(super.provider);

  @override
  String get pattern => (origin as FormatDateProvider).pattern;
}

String _$currentTimeHash() => r'd5e6f2a8bb66f6c371b502baf2680f8590aa28c5';

/// See also [currentTime].
@ProviderFor(currentTime)
final currentTimeProvider = AutoDisposeProvider<String>.internal(
  currentTime,
  name: r'currentTimeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentTimeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentTimeRef = AutoDisposeProviderRef<String>;
String _$formattedDateHash() => r'8399c9357e4b69f778959ed11afce219741c2b5c';

/// See also [formattedDate].
@ProviderFor(formattedDate)
const formattedDateProvider = FormattedDateFamily();

/// See also [formattedDate].
class FormattedDateFamily extends Family<String> {
  /// See also [formattedDate].
  const FormattedDateFamily();

  /// See also [formattedDate].
  FormattedDateProvider call(
    DateTime date, {
    String pattern = 'dd-MM-yyyy',
  }) {
    return FormattedDateProvider(
      date,
      pattern: pattern,
    );
  }

  @override
  FormattedDateProvider getProviderOverride(
    covariant FormattedDateProvider provider,
  ) {
    return call(
      provider.date,
      pattern: provider.pattern,
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
  String? get name => r'formattedDateProvider';
}

/// See also [formattedDate].
class FormattedDateProvider extends AutoDisposeProvider<String> {
  /// See also [formattedDate].
  FormattedDateProvider(
    DateTime date, {
    String pattern = 'dd-MM-yyyy',
  }) : this._internal(
          (ref) => formattedDate(
            ref as FormattedDateRef,
            date,
            pattern: pattern,
          ),
          from: formattedDateProvider,
          name: r'formattedDateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$formattedDateHash,
          dependencies: FormattedDateFamily._dependencies,
          allTransitiveDependencies:
              FormattedDateFamily._allTransitiveDependencies,
          date: date,
          pattern: pattern,
        );

  FormattedDateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.date,
    required this.pattern,
  }) : super.internal();

  final DateTime date;
  final String pattern;

  @override
  Override overrideWith(
    String Function(FormattedDateRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FormattedDateProvider._internal(
        (ref) => create(ref as FormattedDateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        date: date,
        pattern: pattern,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<String> createElement() {
    return _FormattedDateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FormattedDateProvider &&
        other.date == date &&
        other.pattern == pattern;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);
    hash = _SystemHash.combine(hash, pattern.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FormattedDateRef on AutoDisposeProviderRef<String> {
  /// The parameter `date` of this provider.
  DateTime get date;

  /// The parameter `pattern` of this provider.
  String get pattern;
}

class _FormattedDateProviderElement extends AutoDisposeProviderElement<String>
    with FormattedDateRef {
  _FormattedDateProviderElement(super.provider);

  @override
  DateTime get date => (origin as FormattedDateProvider).date;
  @override
  String get pattern => (origin as FormattedDateProvider).pattern;
}

String _$currencyFormatterHash() => r'4f126ebf4c7a4ff24fa96f989de9dc01a093e8e1';

/// See also [currencyFormatter].
@ProviderFor(currencyFormatter)
const currencyFormatterProvider = CurrencyFormatterFamily();

/// See also [currencyFormatter].
class CurrencyFormatterFamily extends Family<NumberFormat> {
  /// See also [currencyFormatter].
  const CurrencyFormatterFamily();

  /// See also [currencyFormatter].
  CurrencyFormatterProvider call({
    String? locale,
  }) {
    return CurrencyFormatterProvider(
      locale: locale,
    );
  }

  @override
  CurrencyFormatterProvider getProviderOverride(
    covariant CurrencyFormatterProvider provider,
  ) {
    return call(
      locale: provider.locale,
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
  String? get name => r'currencyFormatterProvider';
}

/// See also [currencyFormatter].
class CurrencyFormatterProvider extends AutoDisposeProvider<NumberFormat> {
  /// See also [currencyFormatter].
  CurrencyFormatterProvider({
    String? locale,
  }) : this._internal(
          (ref) => currencyFormatter(
            ref as CurrencyFormatterRef,
            locale: locale,
          ),
          from: currencyFormatterProvider,
          name: r'currencyFormatterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$currencyFormatterHash,
          dependencies: CurrencyFormatterFamily._dependencies,
          allTransitiveDependencies:
              CurrencyFormatterFamily._allTransitiveDependencies,
          locale: locale,
        );

  CurrencyFormatterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.locale,
  }) : super.internal();

  final String? locale;

  @override
  Override overrideWith(
    NumberFormat Function(CurrencyFormatterRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CurrencyFormatterProvider._internal(
        (ref) => create(ref as CurrencyFormatterRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        locale: locale,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<NumberFormat> createElement() {
    return _CurrencyFormatterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CurrencyFormatterProvider && other.locale == locale;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, locale.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CurrencyFormatterRef on AutoDisposeProviderRef<NumberFormat> {
  /// The parameter `locale` of this provider.
  String? get locale;
}

class _CurrencyFormatterProviderElement
    extends AutoDisposeProviderElement<NumberFormat> with CurrencyFormatterRef {
  _CurrencyFormatterProviderElement(super.provider);

  @override
  String? get locale => (origin as CurrencyFormatterProvider).locale;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
