import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:template/src/features/system_logs/system_logs.dart';
import 'package:template/src/routes/app_router.gr.dart';
import 'package:template/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_logs/flutter_logs.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ionicons/ionicons.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

@RoutePage()
class SystemLogsPage extends StatelessWidget {
  const SystemLogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('System Logs'),
        actions: [
          IconButton(
            onPressed: () async {
              flogW('SysLogsPage', 'exportLogs', 'test warning logs');
              flogE('SysLogsPage', 'exportLogs', 'test error logs');
              // await FlutterLogs.exportLogs();
            },
            icon: const Icon(Icons.import_export),
          ),
          IconButton(
            onPressed: () async {
              await FlutterLogs.clearLogs();
            },
            icon: const Icon(Icons.delete_forever),
          ),
        ],
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(sysLogDirectoryProvider);

          return switch (state) {
            AsyncData(:final value) => ListView.separated(
                itemBuilder: (context, index) {
                  final item = value[index];

                  final type = FileSystemEntity.typeSync(item.path);

                  if (type != FileSystemEntityType.directory) {
                    return Text(type.toString());
                  }

                  final dir = Directory(item.path);

                  return ListTile(
                    onTap: () {
                      flogI('SystemLogsPage', path.basename(dir.path), 'tap');
                      context.router.push(const SysLogsDetailRoute());
                    },
                    leading: const Icon(Ionicons.folder),
                    title: Text(path.basename(dir.path)),
                  );
                },
                separatorBuilder: (ctx, idx) => const Divider(),
                itemCount: value.length,
              ),
            _ => const Text('No data'),
          };
        },
      ),
    );
  }
}
