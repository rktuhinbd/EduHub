import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../data/repositories/auth_repository_impl.dart';

// State is AsyncValue<UserEntity?> to handle loading/error/data
final authControllerProvider = StateNotifierProvider<AuthController, AsyncValue<UserEntity?>>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return AuthController(repository);
});

class AuthController extends StateNotifier<AsyncValue<UserEntity?>> {
  final AuthRepository _repository;

  AuthController(this._repository) : super(const AsyncValue.data(null)) {
    _checkCurrentUser();
  }

  Future<void> _checkCurrentUser() async {
    state = const AsyncValue.loading();
    try {
      final user = await _repository.getCurrentUser();
      state = AsyncValue.data(user);
    } catch (e) {
      // If we fail to get current user, just set data to null (not logged in)
      state = const AsyncValue.data(null);
    }
  }

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final user = await _repository.login(email, password);
      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> register(String name, String email, String phone, String password) async {
    state = const AsyncValue.loading();
    try {
      await _repository.register(name, email, phone, password);
      // Automatically login after registration or just success?
      // For now, let's login to set the user state
      await login(email, password);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow; // Allow UI to handle specific error message if needed
    }
  }

  Future<void> logout() async {
    await _repository.logout();
    state = const AsyncValue.data(null);
  }
}
