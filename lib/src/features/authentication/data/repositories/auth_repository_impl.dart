import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_api_service.dart';

part 'auth_repository_impl.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  final apiService = ref.watch(authApiServiceProvider);
  return AuthRepositoryImpl(apiService);
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService _apiService;

  AuthRepositoryImpl(this._apiService);

  @override
  Future<UserEntity> login(String email, String password) async {
    final dto = await _apiService.login({
      'email': email,
      'password': password,
    });
    return dto.toEntity();
  }

  @override
  Future<void> logout() async {
    // Implement logout logic (clear tokens, etc)
  }

  @override
  Stream<UserEntity?> get authStateChanges => Stream.value(null); // Mock stream for now
}
