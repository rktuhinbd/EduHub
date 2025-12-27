import 'package:freezed_annotation/freezed_annotation.dart';
import 'video_entity.dart';

part 'playlist_entity.freezed.dart';

@freezed
abstract class PlaylistEntity with _$PlaylistEntity {
  const factory PlaylistEntity({
    required String id,
    required String title,
    required List<VideoEntity> videos,
  }) = _PlaylistEntity;
}
