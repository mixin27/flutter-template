import 'package:auto_route/auto_route.dart';
import 'package:template/src/l10n/string_hardcoded.dart';
import 'package:template/src/routes/app_router.gr.dart';
import 'package:template/src/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            secondary: const Icon(Icons.dark_mode_outlined),
            title: Text('Dark Mode'.hardcoded),
            value: themeState.themeMode == ThemeMode.dark,
            onChanged: (value) => ref
                .watch(themeModeProvider.notifier)
                .setThemeMode(!value ? ThemeMode.light : ThemeMode.dark),
          ),
          ListTile(
            onTap: () {
              context.router.push(const SysLogsDetailRoute());
            },
            leading: const Icon(Icons.monitor),
            title: Text('System Logs'.hardcoded),
          ),
        ],
      ),
    );
  }
}
