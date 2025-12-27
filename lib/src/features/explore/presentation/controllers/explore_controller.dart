import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/playlist_entity.dart';
import '../../data/repositories/youtube_repository.dart';
import 'package:eduhub/src/core/constants/app_constants.dart';

part 'explore_controller.g.dart';

@riverpod
class ExploreController extends _$ExploreController {
  @override
  FutureOr<List<PlaylistEntity>> build() {
    return _fetchPlaylists();
  }

  Future<List<PlaylistEntity>> _fetchPlaylists() async {
    final repository = ref.read(youtubeRepositoryProvider);
    return repository.getChannelPlaylists(AppConstants.youtubeChannelLink);
  }
}
