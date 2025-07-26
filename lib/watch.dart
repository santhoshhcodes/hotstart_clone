import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video/play.dart';
import 'package:video/provider.dart';
import 'package:video_player/video_player.dart';


class Watch extends StatefulWidget {
  const Watch({super.key});

  @override
  State<Watch> createState() => _WatchState();
}

class _WatchState extends State<Watch> {
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
  @override
  Widget build(BuildContext context) {
    if (flickManager == null) {
      return Center(child: CircularProgressIndicator());
    }

    return WillPopScope(
        onWillPop: () async{

      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=>Play()),
              (route)=>false);
      return false;
    },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: FlickVideoPlayer(flickManager: flickManager!),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton(
                      icon: Icon(Icons.clear, color: Colors.black),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => Play()),(route)=>false);
                      },
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Vikram", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text("2023 • 2hr 17m • 4 Language", style: TextStyle(color: Colors.grey, fontSize: 14)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              children: [
                                IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Colors.white,size: 18,),),
                                Text("Watchlist",style: TextStyle(color: Colors.grey,fontSize: 11),)
                              ],
                            ),
                            SizedBox(width: 30,),
                            Column(
                              children: [
                                IconButton(onPressed: (){}, icon: Icon(Icons.share_outlined,color: Colors.white,size: 18,),),
                                Text("Share",style: TextStyle(color: Colors.grey,fontSize: 11),)
                              ],
                            ),
                            SizedBox(width: 30,),
                            Column(
                              children: [
                                IconButton(onPressed: (){}, icon: Icon(Icons.download_outlined,color: Colors.white,size: 18,),),
                                Text("Download",style: TextStyle(color: Colors.grey,fontSize: 11),)
                              ],
                            ),
                            SizedBox(width: 30,),
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Provider.of<Fav>(context, listen: false).toggleFav();
                                  },
                                  icon: Consumer<Fav>(
                                    builder: (context, fav, _) => Icon(
                                      fav.like ? Icons.favorite : Icons.favorite_border_outlined,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                ),
                                Text("Rate", style: TextStyle(color: Colors.grey, fontSize: 11)),
                              ],
                            ),


                          ],
                        ),
                        SizedBox(height: 15,),
                        // Latest Realse
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("More like this",
                                style: TextStyle(color: Colors.white,fontSize: 18),),
                            )),
                        SizedBox(height: 5),
                        SizedBox(
                          height: 200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: popular.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 150,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage(popular[index].image!),
                                      fit: BoxFit.cover,
                                    ),

                                  ),

                                ),
                              );
                            },
                          ),
                        ),
                        // Top Rated on IMDb
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Thriler & More",
                                style: TextStyle(color: Colors.white,fontSize: 18),),
                            )),
                        SizedBox(height: 5),
                        SizedBox(
                          height: 125,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: vid.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[800],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 200,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                                          image: DecorationImage(
                                            image: AssetImage(vid[index].image!),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                        child: Text(
                                          vid[index].text!,
                                          style: TextStyle(color: Colors.white),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

}
class pop {
  String? image;
  String? text;
  pop(this.image, this.text);
}


var movi = [
  {"image": "assets/m2.png", },
  {"image": "assets/pop.png", },
  {"image": "assets/pop1.png", },
  {"image": "assets/pop2.png", },
];

List<pop> popular = movi.map((e) => pop(e['image'], e['text'])).toList();

class Video {
  String? image;
  String? text;
  Video(this.image, this.text);
}


var cont = [
  {"image": "assets/m4.png", "text": "ARM..."},
  {"image": "assets/m5.png", "text": "Gunaah..."},
  {"image": "assets/m1.png", "text": "Master..."},
];

List<Video> vid = cont.map((e) => Video(e['image'], e['text'])).toList();
