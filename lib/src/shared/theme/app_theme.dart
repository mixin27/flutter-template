import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:template/src/shared/shared.dart';

part 'app_theme.g.dart';

class AppTheme {
  /// Light [ThemeData]
  static ThemeData get light {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ).copyWith(
      // Remove shadow from nested routers
      // https://pub.dev/packages/auto_route#remove-shadow-from-nested-routers
      // https://stackoverflow.com/questions/53457772/why-there-is-a-shadow-between-nested-navigator
      // https://stackoverflow.com/questions/68986632/rid-of-elevation-of-nested-flutter-navigator-2-0
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.iOS: NoShadowCupertinoPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      }),
    );
  }

  /// Dark [ThemeData]
  static ThemeData get dark {
    return ThemeData.dark(
      useMaterial3: true,
    ).copyWith(
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.iOS: NoShadowCupertinoPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      }),
    );
  }
}

@riverpod
ThemeData lighTheme(LighThemeRef ref) {
  return AppTheme.light;
}

@riverpod
ThemeData darkTheme(DarkThemeRef ref) {
  return AppTheme.dark;
}

@riverpod
class AppThemeMode extends _$AppThemeMode {
  Future<ThemeMode> _getThemeMode() async {
    final prefs = ref.watch(sharedPrefsProvider);
    final themeMode = prefs.getString(Keys.keyThemeMode) ?? '';

    if (themeMode == ThemeMode.light.name) {
      return ThemeMode.light;
    } else if (themeMode == ThemeMode.dark.name) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }

  @override
  FutureOr<ThemeMode> build() {
    return _getThemeMode();
  }

  void changeTheme(ThemeMode themeMode) async {
    state = await AsyncValue.guard(() async {
      final prefs = ref.watch(sharedPrefsProvider);
      await prefs.setString(Keys.keyThemeMode, themeMode.name);

      return Future.value(themeMode);
    });
  }
}

final themeModeProvider =
    ChangeNotifierProvider.autoDispose<ThemeModeState>((ref) {
  return ThemeModeState();
});

class ThemeModeState extends ChangeNotifier {
  ThemeModeState() {
    final String mode = Hive.box(Keys.keyPrefs).get(Keys.keyThemeMode,
        defaultValue: ThemeMode.system.toString()) as String;
    switch (mode) {
      case 'ThemeMode.dark':
        themeMode = ThemeMode.dark;
        break;
      case 'ThemeMode.light':
        themeMode = ThemeMode.light;
        break;
      case 'ThemeMode.system':
        themeMode = ThemeMode.system;
        break;
    }
  }

  ThemeMode? themeMode;

  void setThemeMode(ThemeMode mode) async {
    themeMode = mode;
    Hive.box(Keys.keyPrefs).put(Keys.keyThemeMode, themeMode.toString());
    notifyListeners();
  }
}
