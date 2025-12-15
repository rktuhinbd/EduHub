import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_provider.dart';
import '../dtos/user_dto.dart';

part 'auth_api_service.g.dart';

abstract class AuthApiService {
  Future<UserDto> login(Map<String, dynamic> body);
}

class AuthApiServiceImpl implements AuthApiService {
  final Dio _dio;

  AuthApiServiceImpl(this._dio);

  @override
  Future<UserDto> login(Map<String, dynamic> body) async {
    try {
      final response = await _dio.post('/auth/login', data: body);
      return UserDto.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}

@riverpod
AuthApiService authApiService(Ref ref) {
  final dio = ref.watch(dioProvider);
  return AuthApiServiceImpl(dio);
}
