import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import '../../../../core/constants/app_constants.dart';
import '../../domain/models/video_playlist_item.dart';

part 'learn_controller.g.dart';

@riverpod
class LearnController extends _$LearnController {
  @override
  FutureOr<List<VideoPlaylistItem>> build() async {
    return _fetchVideoMetadata();
  }

  Future<List<VideoPlaylistItem>> _fetchVideoMetadata() async {
    final yt = YoutubeExplode();
    final List<VideoPlaylistItem> playlist = [];

    try {
      for (final url in AppConstants.playlistVideos) {
        // Extract video ID from URL
        final id = VideoId(url);
        final video = await yt.videos.get(id);
        
        playlist.add(VideoPlaylistItem(
          videoId: video.id.value,
          url: url,
          title: video.title,
          description: video.description,
          thumbnail: video.thumbnails.highResUrl,
          author: video.author,
        ));
      }
    } catch (e) {
      // Handle error or return what we have

    } finally {
      yt.close();
    }
    
    return playlist;
  }
}
