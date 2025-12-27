import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/course_entity.dart';

part 'course_dto.freezed.dart';
part 'course_dto.g.dart';

@freezed
abstract class CourseDto with _$CourseDto {
  const CourseDto._();

  const factory CourseDto({
    required String id,
    required String title,
    required String description,
    @JsonKey(name: 'image_url') required String imageUrl,
  }) = _CourseDto;

  factory CourseDto.fromJson(Map<String, dynamic> json) => _$CourseDtoFromJson(json);

  CourseEntity toEntity() {
    return CourseEntity(
      id: id,
      title: title,
      description: description,
      imageUrl: imageUrl,
    );
  }
}
