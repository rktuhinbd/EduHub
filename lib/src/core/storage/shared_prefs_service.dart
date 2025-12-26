import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_prefs_service.g.dart';

@Riverpod(keepAlive: true)
SharedPrefsService sharedPrefsService(Ref ref) {
  throw UnimplementedError('Initialize this provider in main.dart');
}

class SharedPrefsService {
  final SharedPreferences _prefs;

  SharedPrefsService(this._prefs);

  static const _onboardingCompleteKey = 'onboarding_complete';

  bool get isOnboardingComplete => _prefs.getBool(_onboardingCompleteKey) ?? false;

  Future<void> setOnboardingComplete() async {
    await _prefs.setBool(_onboardingCompleteKey, true);
  }
}
