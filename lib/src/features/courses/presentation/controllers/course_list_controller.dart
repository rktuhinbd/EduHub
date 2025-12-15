import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/course_entity.dart';
import '../../domain/repositories/courses_repository.dart';
import '../../data/repositories/courses_repository_impl.dart';

final courseListControllerProvider = StateNotifierProvider<CourseListController, AsyncValue<List<CourseEntity>>>((ref) {
  final repository = ref.watch(coursesRepositoryProvider);
  return CourseListController(repository);
});

class CourseListController extends StateNotifier<AsyncValue<List<CourseEntity>>> {
  final CoursesRepository _repository;

  CourseListController(this._repository) : super(const AsyncValue.loading()) {
    _loadCourses();
  }

  Future<void> _loadCourses() async {
    try {
      final courses = await _repository.getCourses();
      state = AsyncValue.data(courses);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    await _loadCourses();
  }
}
