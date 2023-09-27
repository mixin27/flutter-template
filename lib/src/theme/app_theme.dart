import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:template/src/providers/providers.dart';

part 'app_theme.g.dart';

class AppTheme {
  static ThemeData get light => ThemeData.light(useMaterial3: true).copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      );

  static ThemeData get dark => ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      );
}

@riverpod
class AppThemeMode extends _$AppThemeMode {
  ThemeMode _getCurrentTheme() {
    final prefs = ref.watch(sharedPreferencesProvider);
    final theme = prefs.getString('theme_mode');
    final value = ThemeMode.values.byName(theme ?? 'light');
    return value;
  }

  @override
  ThemeMode build() {
    return _getCurrentTheme();
  }

  void toggleTheme() async {
    state = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    final prefs = ref.watch(sharedPreferencesProvider);
    await prefs.setString(
        'theme_mode', state == ThemeMode.dark ? 'dark' : 'light');
  }
}
