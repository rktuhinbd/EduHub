import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.eduhub.com', // Placeholder URL

      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );

  // Add interceptors here (e.g., LogInterceptor, AuthInterceptor)
  dio.interceptors.add(LogInterceptor(responseBody: true));

  return dio;
}
