import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../domain/models/video_playlist_item.dart';
import '../controllers/learn_controller.dart';

class LearnScreen extends ConsumerStatefulWidget {
  const LearnScreen({super.key});

  @override
  ConsumerState<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends ConsumerState<LearnScreen> {
  YoutubePlayerController? _controller;
  int _currentIndex = 0;
  bool _isPlayerReady = false;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _initializePlayer(List<VideoPlaylistItem> videos) {
    if (_controller != null) return;

    _controller = YoutubePlayerController(
      initialVideoId: videos[_currentIndex].videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        enableCaption: true,
      ),
    )..addListener(_listener);
  }

  void _listener() {
    if (_isPlayerReady && mounted && !_controller!.value.isFullScreen) {
      // updates
    }
  }

  void _playVideo(int index, List<VideoPlaylistItem> videos) {
    if (index < 0 || index >= videos.length) return;

    setState(() {
      _currentIndex = index;
    });
    _controller?.load(videos[index].videoId);
    _controller?.play();
  }

  void _onPrevious(List<VideoPlaylistItem> videos) {
    if (_currentIndex > 0) {
      _playVideo(_currentIndex - 1, videos);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('This is the first video in the list'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _onNext(List<VideoPlaylistItem> videos) {
    if (_currentIndex < videos.length - 1) {
      _playVideo(_currentIndex + 1, videos);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('You have reached the end of the playlist'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _showPlaylist(BuildContext context, List<VideoPlaylistItem> videos) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Course Playlist (${videos.length})',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: ListView.builder(
                  itemCount: videos.length,
                  itemBuilder: (context, index) {
                    final isPlaying = index == _currentIndex;
                    final video = videos[index];
                    return ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      selected: isPlaying,
                      selectedTileColor: Colors.blue.withValues(alpha: 0.1),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.network(
                              video.thumbnail,
                              width: 80,
                              height: 45,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Container(
                                width: 80,
                                height: 45,
                                color: Colors.grey[300],
                                child: const Icon(Icons.broken_image, size: 20),
                              ),
                            ),
                            if (isPlaying)
                              Container(
                                color: Colors.black45,
                                child: const Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                          ],
                        ),
                      ),
                      title: Text(
                        video.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight:
                              isPlaying ? FontWeight.bold : FontWeight.normal,
                          color: isPlaying ? Colors.blue : Colors.black87,
                        ),
                      ),
                      subtitle: Text(
                        'Video ${index + 1}',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                      onTap: () {
                        _playVideo(index, videos);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final playlistAsync = ref.watch(learnControllerProvider);

    return Scaffold(
      body: playlistAsync.when(
        data: (videos) {
          if (videos.isEmpty) {
            return const Center(child: Text('No videos found'));
          }

          _initializePlayer(videos);

          return SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Video Player Section
                if (_controller != null)
                  YoutubePlayerBuilder(
                    player: YoutubePlayer(
                      controller: _controller!,
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: Colors.blueAccent,
                      onReady: () {
                        _isPlayerReady = true;
                      },
                    ),
                    builder: (context, player) {
                      return Column(
                        children: [
                          player,
                          // Custom Controls Bar under player
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            color: Colors.grey[900],
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.skip_previous,
                                      color: Colors.white),
                                  onPressed: _currentIndex == 0
                                      ? () => _onPrevious(videos) // still trigger snackbar
                                      : () => _onPrevious(videos),
                                  color: _currentIndex == 0
                                      ? Colors.white38
                                      : Colors.white,
                                ),
                                IconButton(
                                  icon: const Icon(Icons.playlist_play,
                                      color: Colors.white),
                                  onPressed: () => _showPlaylist(context, videos),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.skip_next,
                                      color: Colors.white),
                                  onPressed: _currentIndex == videos.length - 1
                                      ? () => _onNext(videos) // still trigger snackbar
                                      : () => _onNext(videos),
                                  color: _currentIndex == videos.length - 1
                                      ? Colors.white38
                                      : Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),

                // Video Info Section
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          videos[_currentIndex].title,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 8),
                         Row(
                           children: [
                             const CircleAvatar(
                               radius: 12,
                               child: Icon(Icons.person, size: 16),
                             ),
                             const SizedBox(width: 8),
                             Text(
                               videos[_currentIndex].author,
                               style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                 color: Colors.grey[700],
                                 fontWeight: FontWeight.w500,
                               ),
                             ),
                           ],
                         ),
                        const SizedBox(height: 16),
                        Text(
                          'Description',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          videos[_currentIndex].description.isNotEmpty 
                              ? videos[_currentIndex].description 
                              : 'No description available.',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.grey[800],
                                height: 1.5,
                              ),
                        ),
                        const SizedBox(height: 80), // Bottom padding
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
