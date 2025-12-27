import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_api_service.dart';

import '../../../../core/storage/shared_prefs_service.dart';

part 'auth_repository_impl.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  final apiService = ref.watch(authApiServiceProvider);
  final sharedPrefs = ref.watch(sharedPrefsServiceProvider);
  return AuthRepositoryImpl(apiService, sharedPrefs);
}

class AuthRepositoryImpl implements AuthRepository {
  // ignore: unused_field
  final AuthApiService _apiService;
  final SharedPrefsService _sharedPrefsService;

  AuthRepositoryImpl(this._apiService, this._sharedPrefsService);

  @override
  Future<UserEntity> login(String email, String password) async {
    // Determine if we have a user in local "DB"
    final userMap = _sharedPrefsService.getUser(email, password);

    if (userMap != null) {
      return UserEntity(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        email: userMap['email'] ?? '',
        name: userMap['name'] ?? '',
      );
    } else {
      throw Exception('Invalid credentials or user not found');
    }
  }

  @override
  Future<void> register(String name, String email, String phone, String password) async {
    final userMap = {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    };
    await _sharedPrefsService.saveUser(userMap);
  }


  @override
  Future<void> logout() async {
    // Implement logout logic (clear tokens, etc)
  }

  @override
  Stream<UserEntity?> get authStateChanges => Stream.value(null); // Mock stream for now
}
