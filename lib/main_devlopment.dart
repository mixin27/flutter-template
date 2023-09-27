import 'package:template/bootstrap.dart';
import 'package:template/env/app_env.dart';
import 'package:template/src/features/app/app.dart';

void main() {
  bootstrap(AppEnvironment.dev, MyApp.new);
}
