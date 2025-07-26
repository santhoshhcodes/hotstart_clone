import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  FlickManager? flickManager;
  bool showFullDescription = false;

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
      return  Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.red[900],
      //     title:  Text("Video Player",style: TextStyle(color: Colors.white,fontSize: 18),)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: FlickVideoPlayer(flickManager: flickManager!),
          ),
          Container(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text("Cartoon video-kids",style: TextStyle(color: Colors.white,fontSize: 22),),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          showFullDescription = !showFullDescription;
                        });
                      },
                      child: Text(
                        showFullDescription
                            ? "Big Buck Bunny is a short computer-animated comedy "
                            "film by Blender Foundation. The plot follows a large rabbit "
                            "who seeks revenge on bullies. This is a full high-definition video "
                            "for demo and test purpose. show less..."
                            : "Big Buck Bunny is a short computer-animated...",
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children: [

                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person),
                      ),
                      SizedBox(width: 10,),
                      Expanded(child: Text("Sandy Blogs",style: TextStyle(color: Colors.white),)),
                      ElevatedButton(
                          onPressed: (){},
                          child: Text("subsribe",style: TextStyle(color: Colors.white),),
                          style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 20
                          ),

                        )),


                    ],
                  ),
                ],
              ),
            ),
          ),
          Divider(thickness: 1),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "Suggested Videos",
              style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(),
          ),

        ],
      ),
    );
  }
}
