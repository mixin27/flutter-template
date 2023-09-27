import 'package:template/env/env.dart';

enum AppEnvironment { dev, stg, prod }

abstract class EnvInfo {
  static AppEnvironment _environment = AppEnvironment.dev;

  static void initialize(AppEnvironment environment) {
    EnvInfo._environment = environment;
  }

  static String get appName => _environment._appTitle;
  static String get envName => _environment._envName;
  static String get connectionString => _environment._connectionString;
  static String get apiKey => _environment._apiKey;
  static AppEnvironment get environment => _environment;
  static bool get isProduction => _environment == AppEnvironment.prod;
}

extension _EnvProperties on AppEnvironment {
  static const _appTitles = {
    AppEnvironment.dev: '[Dev] Template',
    AppEnvironment.stg: '[Stg] Template',
    AppEnvironment.prod: 'Template',
  };

  static final _connectionStrings = {
    AppEnvironment.dev: EnvDev.apiUrl,
    AppEnvironment.stg: EnvStg.apiUrl,
    AppEnvironment.prod: EnvProd.apiUrl,
  };

  static final _apiKeys = {
    AppEnvironment.dev: EnvDev.apiKey,
    AppEnvironment.stg: EnvStg.apiKey,
    AppEnvironment.prod: EnvProd.apiKey,
  };

  static const _envs = {
    AppEnvironment.dev: 'dev',
    AppEnvironment.stg: 'stg',
    AppEnvironment.prod: 'prod',
  };

  String get _appTitle => _appTitles[this]!;
  String get _envName => _envs[this]!;
  String get _connectionString => _connectionStrings[this]!;
  String get _apiKey => _apiKeys[this]!;
}
