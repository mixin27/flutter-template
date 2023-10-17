import 'package:template/src/l10n/l10n.dart';
import 'package:template/src/routes/routes.dart';
import 'package:template/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppWidget extends HookConsumerWidget {
  AppWidget({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeModeProvider);

    return MaterialApp.router(
      title: 'Ecommerce',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: currentTheme.themeMode,
      // Localization stuff
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // routes
      routerConfig: _appRouter.config(
        navigatorObservers: () => [AppRouteObserver()],
        reevaluateListenable: ref.watch(authProviderProvider),
      ),
    );
  }
}
