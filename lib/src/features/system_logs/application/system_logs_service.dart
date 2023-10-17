import 'package:template/src/features/system_logs/system_logs.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'system_logs_service.g.dart';

class SystemLogsService {
  SystemLogsService(this.ref) {
    _init();
  }

  final Ref ref;

  void _init() {
    ref.listen(appLogsControllerProvider, (previous, next) {});
  }
}

@Riverpod(keepAlive: true)
SystemLogsService sysLogsService(SysLogsServiceRef ref) {
  return SystemLogsService(ref);
}
