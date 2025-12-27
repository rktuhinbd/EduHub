import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> login(String email, String password);
  Future<void> register(
      String name, String email, String phone, String password);
  Future<UserEntity?> getCurrentUser();
  Future<void> logout();
  Stream<UserEntity?> get authStateChanges;
}
