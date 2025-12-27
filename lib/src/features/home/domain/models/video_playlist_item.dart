class VideoPlaylistItem {
  final String videoId;
  final String url;
  final String title;
  final String description;
  final String thumbnail;
  final String author;

  VideoPlaylistItem({
    required this.videoId,
    required this.url,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.author,
  });

  factory VideoPlaylistItem.loading(String url) {
    return VideoPlaylistItem(
      videoId: '',
      url: url,
      title: 'Loading...',
      description: '',
      thumbnail: '',
      author: '',
    );
  }
}
