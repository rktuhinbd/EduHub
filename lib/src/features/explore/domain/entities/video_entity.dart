import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_entity.freezed.dart';

@freezed
abstract class VideoEntity with _$VideoEntity {
  const factory VideoEntity({
    required String id,
    required String title,
    required String thumbnailUrl,
    required String duration,
  }) = _VideoEntity;
}
