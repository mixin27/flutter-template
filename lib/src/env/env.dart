import 'package:envied/envied.dart';

part 'env.g.dart';

enum Flavor {
  development,
  staging,
  production,
}

class Env {
  static String getApiUrl(Flavor flavor) => switch (flavor) {
        Flavor.staging => EnvStaging.apiUrl,
        Flavor.production => EnvProduction.apiUrl,
        _ => EnvDevelopment.apiUrl,
      };
}

@Envied(path: '.env.development')
abstract class EnvDevelopment {
  @EnviedField(varName: 'API_URL', obfuscate: true)
  static final String apiUrl = _EnvDevelopment.apiUrl;
}

@Envied(path: '.env.staging')
abstract class EnvStaging {
  @EnviedField(varName: 'API_URL', obfuscate: true)
  static final String apiUrl = _EnvStaging.apiUrl;
}

@Envied(path: '.env.production')
abstract class EnvProduction {
  @EnviedField(varName: 'API_URL', obfuscate: true)
  static final String apiUrl = _EnvProduction.apiUrl;
}
