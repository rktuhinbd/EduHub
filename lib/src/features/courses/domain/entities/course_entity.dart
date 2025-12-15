import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_entity.freezed.dart';

@freezed
abstract class CourseEntity with _$CourseEntity {
  const factory CourseEntity({
    required String id,
    required String title,
    required String description,
    required String imageUrl,
  }) = _CourseEntity;
}
