import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_prefs_service.g.dart';

@Riverpod(keepAlive: true)
SharedPrefsService sharedPrefsService(SharedPrefsServiceRef ref) {
  throw UnimplementedError('Initialize this provider in main.dart');
}

class SharedPrefsService {
  final SharedPreferences _prefs;

  SharedPrefsService(this._prefs);

  static const _onboardingCompleteKey = 'onboarding_complete';
  static const _usersKey = 'users_db'; // We will store a JSON list of users string
  static const _currentUserKey = 'current_user_email';

  bool get isOnboardingComplete => _prefs.getBool(_onboardingCompleteKey) ?? false;
  String? get currentUserEmail => _prefs.getString(_currentUserKey);

  Future<void> setOnboardingComplete() async {
    await _prefs.setBool(_onboardingCompleteKey, true);
  }

  Future<void> saveCurrentUser(String email) async {
    await _prefs.setString(_currentUserKey, email);
  }

  Future<void> clearCurrentUser() async {
    await _prefs.remove(_currentUserKey);
  }

  // Basic User Storage (Simulating DB)
  
  Future<void> saveUser(Map<String, dynamic> userMap) async {
    final List<String> usersJson = _prefs.getStringList(_usersKey) ?? [];
    
    // Check if user already exists
    final email = userMap['email'] as String;
    final exists = usersJson.any((u) {
      final decoded = jsonDecode(u) as Map<String, dynamic>;
      return decoded['email'] == email;
    });

    if (exists) {
      throw Exception('User with this email already exists.');
    }

    usersJson.add(jsonEncode(userMap));
    await _prefs.setStringList(_usersKey, usersJson);
  }

  Map<String, dynamic>? getUser(String email, String password) {
    final List<String> usersJson = _prefs.getStringList(_usersKey) ?? [];
    
    for (final userStr in usersJson) {
      final userMap = jsonDecode(userStr) as Map<String, dynamic>;
      if (userMap['email'] == email && userMap['password'] == password) {
        return userMap;
      }
    }
    return null;
  }

  Map<String, dynamic>? getUserByEmail(String email) {
    final List<String> usersJson = _prefs.getStringList(_usersKey) ?? [];
    
    for (final userStr in usersJson) {
      final userMap = jsonDecode(userStr) as Map<String, dynamic>;
      if (userMap['email'] == email) {
        return userMap;
      }
    }
    return null;
  }
}
