import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomYoutubePlayer extends StatefulWidget {
  final String videoTitle;
  final String? videoURL;

  const CustomYoutubePlayer({
    required this.videoTitle,
    this.videoURL,
    super.key,
  });

  @override
  State<CustomYoutubePlayer> createState() => _CustomYoutubePlayerState();
}

class _CustomYoutubePlayerState extends State<CustomYoutubePlayer> {
  YoutubePlayerController? controller;

  @override
  void initState() {
    super.initState();

    String videoId = _extractVideoId(widget.videoURL);

    controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(autoPlay: false),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  String _extractVideoId(String? videoURL) {
    final Uri uri = Uri.parse(videoURL!);
    if (uri.host.contains('youtu.be')) {
      return uri.pathSegments.last;
    } else if (uri.host.contains('youtube.com')) {
      return uri.queryParameters['v'] ?? '';
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        YoutubePlayer(
          controller: controller!,
          showVideoProgressIndicator: true,
        ),
        Text(
            widget.videoTitle,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
        ),
      ],
    );
  }
}
