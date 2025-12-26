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
  // ignore: unused_field
  final AuthApiService _apiService;

  AuthRepositoryImpl(this._apiService);

  @override
  Future<UserEntity> login(String email, String password) async {
    // Mock login for now to show requested user details
    await Future.delayed(const Duration(seconds: 1));
    return const UserEntity(
      id: '1',
      email: 'rejaul@example.com',
      name: 'Md. Rejaul Karim',
    );
  }

  @override
  Future<void> logout() async {
    // Implement logout logic (clear tokens, etc)
  }

  @override
  Stream<UserEntity?> get authStateChanges => Stream.value(null); // Mock stream for now
}
