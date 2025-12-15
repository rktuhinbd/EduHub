import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_provider.dart';
import '../dtos/course_dto.dart';

part 'courses_api_service.g.dart';

abstract class CoursesApiService {
  Future<List<CourseDto>> getCourses();
  Future<CourseDto> getCourseDetails(String id);
}

class CoursesApiServiceImpl implements CoursesApiService {
  final Dio _dio;

  CoursesApiServiceImpl(this._dio);

  @override
  Future<List<CourseDto>> getCourses() async {
    try {
      final response = await _dio.get('/courses');
      final List<dynamic> data = response.data;
      return data.map((e) => CourseDto.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CourseDto> getCourseDetails(String id) async {
    try {
      final response = await _dio.get('/courses/$id');
      return CourseDto.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}

@riverpod
CoursesApiService coursesApiService(Ref ref) {
  final dio = ref.watch(dioProvider);
  return CoursesApiServiceImpl(dio);
}
