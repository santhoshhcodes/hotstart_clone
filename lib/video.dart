import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

class FlickSimplePlayer extends StatefulWidget {
  const FlickSimplePlayer({super.key});

  @override
  State<FlickSimplePlayer> createState() => _FlickSimplePlayerState();
}

class _FlickSimplePlayerState extends State<FlickSimplePlayer> {
  FlickManager? flickManager; // make it nullable

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.networkUrl(
        Uri.parse("http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
      ),
    );
  }

  @override
  void dispose() {
    flickManager?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (flickManager == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Flick Video Player")),
      body:
      Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: FlickVideoPlayer(flickManager: flickManager!,
            ),
          ),
          Text("cartoon video")
        ],
      ),
    );
  }
}
