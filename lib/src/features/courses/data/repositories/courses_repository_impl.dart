import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/course_entity.dart';
import '../../domain/repositories/courses_repository.dart';
import '../datasources/courses_api_service.dart';

part 'courses_repository_impl.g.dart';

@riverpod
CoursesRepository coursesRepository(Ref ref) {
  final apiService = ref.watch(coursesApiServiceProvider);
  return CoursesRepositoryImpl(apiService);
}

class CoursesRepositoryImpl implements CoursesRepository {
  final CoursesApiService _apiService;

  CoursesRepositoryImpl(this._apiService);

  @override
  Future<List<CourseEntity>> getCourses() async {
    final dtos = await _apiService.getCourses();
    return dtos.map((e) => e.toEntity()).toList();
  }

  @override
  Future<CourseEntity> getCourseDetails(String courseId) async {
    final dto = await _apiService.getCourseDetails(courseId);
    return dto.toEntity();
  }
}
