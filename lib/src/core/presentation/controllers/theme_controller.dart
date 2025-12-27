import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../storage/shared_prefs_service.dart';

part 'theme_controller.g.dart';

@riverpod
class ThemeController extends _$ThemeController {
  @override
  ThemeMode build() {
    final prefs = ref.watch(sharedPrefsServiceProvider);
    final savedMode = prefs.themeMode;
    return _parseThemeMode(savedMode);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    state = mode;
    final prefs = ref.read(sharedPrefsServiceProvider);
    await prefs.setThemeMode(mode.name);
  }

  ThemeMode _parseThemeMode(String? mode) {
    if (mode == null) return ThemeMode.system;
    try {
      return ThemeMode.values.firstWhere((e) => e.name == mode);
    } catch (_) {
      return ThemeMode.system;
    }
  }
}
