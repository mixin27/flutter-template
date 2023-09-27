import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env.development')
abstract class EnvDev {
  @EnviedField(varName: 'API_URL', obfuscate: true)
  static final String apiUrl = _EnvDev.apiUrl;

  @EnviedField(varName: 'API_KEY', obfuscate: true)
  static final String apiKey = _EnvDev.apiKey;
}

@Envied(path: '.env.staging')
abstract class EnvStg {
  @EnviedField(varName: 'API_URL', obfuscate: true)
  static final String apiUrl = _EnvStg.apiUrl;

  @EnviedField(varName: 'API_KEY', obfuscate: true)
  static final String apiKey = _EnvStg.apiKey;
}

@Envied(path: '.env.production')
abstract class EnvProd {
  @EnviedField(varName: 'API_URL', obfuscate: true)
  static final String apiUrl = _EnvProd.apiUrl;

  @EnviedField(varName: 'API_KEY', obfuscate: true)
  static final String apiKey = _EnvProd.apiKey;
}
