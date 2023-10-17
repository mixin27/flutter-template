import 'package:flutter_logs/flutter_logs.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:template/src/bootstrap/bootstrap.dart';
import 'package:template/src/features/system_logs/system_logs.dart';

extension AppBootstrapLogger on AppBootstrap {
  Future<void> setupFlutterLogs() async {
    await FlutterLogs.initLogs(
      logLevelsEnabled: [
        LogLevel.INFO,
        LogLevel.WARNING,
        LogLevel.ERROR,
        LogLevel.SEVERE,
      ],
      directoryStructure: DirectoryStructure.FOR_DATE,
      timeStampFormat: TimeStampFormat.TIME_FORMAT_READABLE,
      logFileExtension: LogFileExtension.TXT,
      logsExportDirectoryName: 'Exported',
      logsWriteDirectoryName: 'MyLogs',
      debugFileOperations: true,
      isDebuggable: true,
    );
  }

  void listenLogsContent(ProviderContainer container) {
    container.read(sysLogsServiceProvider);
  }
}
