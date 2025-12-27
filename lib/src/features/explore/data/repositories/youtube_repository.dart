import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:eduhub/src/core/constants/app_constants.dart';
import '../../domain/entities/playlist_entity.dart';
import '../../domain/entities/video_entity.dart';

part 'youtube_repository.g.dart';

@riverpod
YoutubeRepository youtubeRepository(Ref ref) {
  return YoutubeRepositoryImpl();
}

abstract class YoutubeRepository {
  Future<List<PlaylistEntity>> getChannelPlaylists(String channelUrl);
}

class YoutubeRepositoryImpl implements YoutubeRepository {
  final _yt = YoutubeExplode();

  @override
  Future<List<PlaylistEntity>> getChannelPlaylists(String channelUrl) async {
    try {
      // 1. Get Channel ID from Constants
      const channelId = AppConstants.youtubeChannelId;
      
      // 2. Fetch "Uploads" Playlist directly
      // YouTube convention: Replace 'UC' (Channel) with 'UU' (Uploads Playlist)
      final uploadPlaylistId = channelId.replaceFirst('UC', 'UU');
      
      // ignore: avoid_print
      print('DEBUG: Fetching uploads for playlist: $uploadPlaylistId');

      final uploads = await _yt.playlists.getVideos(uploadPlaylistId).take(20).toList();
      
      // ignore: avoid_print
      print('DEBUG: Fetched ${uploads.length} videos');

      final List<PlaylistEntity> playlistEntities = [];
      
      if (uploads.isNotEmpty) {
           final videoEntities = uploads.map((v) => VideoEntity(
              id: v.id.value,
              title: v.title,
              thumbnailUrl: v.thumbnails.mediumResUrl,
              duration: _formatDuration(v.duration),
            )).toList();
            
            playlistEntities.add(PlaylistEntity(
              id: uploadPlaylistId,
              title: 'Latest Videos',
              videos: videoEntities,
            ));
      }
      
      return playlistEntities;

    } catch (e) {
      // ignore: avoid_print
      print('Error fetching youtube data: $e');
      return [];
    }

    }


  String _formatDuration(Duration? duration) {
    if (duration == null) return '00:00';
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    if (duration.inHours > 0) {
      return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    }
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}
