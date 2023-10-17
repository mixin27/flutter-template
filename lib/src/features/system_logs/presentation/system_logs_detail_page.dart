import 'package:auto_route/auto_route.dart';
import 'package:template/src/features/system_logs/presentation/logs_controller.dart';
import 'package:template/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class SysLogsDetailPage extends StatefulHookConsumerWidget {
  const SysLogsDetailPage({
    super.key,
  });

  @override
  ConsumerState<SysLogsDetailPage> createState() => _SysLogsDetailPageState();
}

class _SysLogsDetailPageState extends ConsumerState<SysLogsDetailPage> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() {
    Future.microtask(() {
      ref.read(appLogsControllerProvider);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logs'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          return switch (ref.watch(appLogsControllerProvider)) {
            AsyncData(:final value) => ListView.separated(
                itemCount: value.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final item = value[index];

                  final parts = item.split('{');
                  final tag = parts[1].replaceAll('}', '');
                  final subTag = parts[2].replaceAll('}', '').trim();
                  final message = parts[3].replaceAll('}', '').trim();
                  final time = parts[4].replaceAll('}', '').trim();
                  final level = parts.last.replaceAll('}', '');

                  final levelColor =
                      switch (level.characters.first.toLowerCase()) {
                    'i' => Colors.blueAccent,
                    'e' => Colors.redAccent,
                    'w' => Colors.amberAccent,
                    _ => Colors.deepPurpleAccent,
                  };

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: levelColor,
                            shape: BoxShape.circle,
                            // borderRadius:
                            //     const BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Text(
                            level.characters.first.toLowerCase(),
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                          ),
                        ),
                        gapW12,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                message,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              gapH8,
                              Wrap(
                                runSpacing: 10,
                                spacing: 10,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    decoration: const BoxDecoration(
                                      color: Colors.redAccent,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    child: Text(
                                      tag,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(
                                            color: Colors.white,
                                          ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    decoration: const BoxDecoration(
                                      color: Colors.greenAccent,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    child: Text(
                                      time,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(
                                            color: Colors.white,
                                          ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    decoration: const BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    child: Text(
                                      subTag,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(
                                            color: Colors.white,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            _ => const Center(
                child: Text('No data'),
              )
          };
        },
      ),
    );
  }
}
