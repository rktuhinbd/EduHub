import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/login_use_case.dart';

// State is AsyncValue<UserEntity?> to handle loading/error/data
final authControllerProvider = StateNotifierProvider<AuthController, AsyncValue<UserEntity?>>((ref) {
  final loginUseCase = ref.watch(loginUseCaseProvider);
  return AuthController(loginUseCase);
});

class AuthController extends StateNotifier<AsyncValue<UserEntity?>> {
  final LoginUseCase _loginUseCase;

  AuthController(this._loginUseCase) : super(const AsyncValue.data(null));

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final user = await _loginUseCase(email, password);
      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void logout() {
    state = const AsyncValue.data(null);
  }
}
