import 'dart:io';

import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logs_controller.g.dart';

@riverpod
class SysLogDirectory extends _$SysLogDirectory {
  Future<List<FileSystemEntity>> _fetchData() async {
    Directory? externalDirectory;

    if (Platform.isIOS) {
      externalDirectory = await getApplicationDocumentsDirectory();
    } else {
      externalDirectory = await getExternalStorageDirectory();
    }

    if (externalDirectory == null) {
      return [];
    } else {
      final dir = Directory('${externalDirectory.path}/MyLogs/Logs');
      return dir.listSync().toList();
    }
  }

  @override
  Future<List<FileSystemEntity>> build() {
    return _fetchData();
  }
}

@Riverpod(keepAlive: true)
class AppLogsController extends _$AppLogsController {
  Stream<List<String>> _fetchLogs() async* {
    final date = DateTime.now();
    final folderName = DateFormat('ddMMyyyy').format(date);
    final fileName = '${DateFormat('ddMMyyyyHH').format(date)}.txt';

    Directory? externalDirectory;

    if (Platform.isIOS) {
      externalDirectory = await getApplicationDocumentsDirectory();
    } else {
      externalDirectory = await getExternalStorageDirectory();
    }
    final file =
        File('${externalDirectory?.path}/MyLogs/Logs/$folderName/$fileName');

    if (file.existsSync()) {
      yield* file.watch().asyncMap((event) async {
        final lines = await File(event.path).readAsLines();
        return lines.reversed.toList();
      });
    } else {
      _fetchLogs();
    }
  }

  @override
  Stream<List<String>> build() {
    return _fetchLogs();
  }
}
