import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video/home.dart';
import 'package:video/provider.dart';
import 'package:video/watch.dart';

class Play extends StatefulWidget {
  const Play({super.key});

  @override
  State<Play> createState() => _PlayState();
}

class _PlayState extends State<Play> {
  bool show = true;
  bool fav = true;
  String selectedLang = "Tamil";


  @override
  Widget build(BuildContext context) {
    return WillPopScope (
      onWillPop: ()async{
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=>Home()),(route)=>false);
        return false;
      },

      child: Scaffold(
        backgroundColor: Colors.black,
        body: NestedScrollView(
            headerSliverBuilder: (BuildContext content,bool innerBoxIsScrolled){
              return [
                SliverAppBar(
                  floating: false,
                  pinned: true,
                  snap: false,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>Home()));
                      }, icon: Icon(Icons.clear,color: Colors.white,))

                    ),
                  ],
                  backgroundColor: Colors.black,
                  expandedHeight: 280,
                  automaticallyImplyLeading: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,

                    title: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.5),
                      child: Text(
                        "Vikram",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    background: Column(
                      children: [
                        Stack(
                          children: [
                            // Background Image
                            Container(
                              height: 220,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/vikram.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),

                            // Text Inside Image at Bottom Right
                            Positioned(
                              bottom: 10,
                              left: 12,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    show = !show;
                                  });
                                },
                                child: show
                                    ? Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    "$selectedLang >",
                                    style: TextStyle(color: Colors.white, fontSize: 14),
                                  ),
                                )
                                    : Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ...["Tamil", "English", "Malayalam", "Telugu"].map((lang) {
                                      bool isSelected = selectedLang == lang;
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedLang = lang;
                                            show = true; // Close on select
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.symmetric(horizontal: 5),
                                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                          decoration: BoxDecoration(
                                            color: isSelected ? Colors.white24 : Colors.transparent,
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(
                                              color: isSelected ? Colors.white60 : Colors.transparent,
                                            ),
                                          ),
                                          child: Text(
                                            lang,
                                            style: TextStyle(color: Colors.white, fontSize: 13),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    SizedBox(width: 8),
                                    Text(">", style: TextStyle(color: Colors.white, fontSize: 18)),
                                  ],
                                ),
                              ),
                            )

                          ],
                        ),
                      ],
                    ),
                  ),
                ),

              ];
            },
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("2022",style: TextStyle(color: Colors.white,fontSize: 11),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),

                          decoration: BoxDecoration(
                            color: Colors.white24,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text("U/A 13+", style: TextStyle(color: Colors.white, fontSize: 10)),

                                      ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("2h 17m",style: TextStyle(color: Colors.white,fontSize: 11),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("5Language",style: TextStyle(color: Colors.white,fontSize: 11),),
                      ),

                ],

                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>Watch()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white70,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(horizontal:80, vertical: 18),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(Icons.play_arrow, color: Colors.black),
                        ),
                        SizedBox(width: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("Watch Now", style: TextStyle(color: Colors.black)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("A special agent investigates a murder committed by a masked group of serial killers. However,"
                        " a tangled maze of clues soon leads him to the drug kingpin of Chennai.",
                    style: TextStyle(color: Colors.grey,fontSize: 10),
                    ),
                  ),
                  SizedBox(height: 15,),
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
                  SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("More Like This",
                          style: TextStyle(color: Colors.white,fontSize: 20),),
                      )),
                  SizedBox(height: 5),
                  SizedBox(
                    height: 400,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: vido.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                width: 100,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                                  image: DecorationImage(
                                    image: AssetImage(vid[index].image!),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: 100,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                                  image: DecorationImage(
                                    image: AssetImage(vido[index].image!),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),


                    ]
                  ),
            )


      )
      ),
    );
  }
}
class Video {
  String? image;
  String? text;
  Video(this.image, this.text);
}


var cont = [
  {"image": "assets/m5.png", "text": "Gunaah..."},
  {"image": "assets/m4.png", "text": "ARM..."},
  {"image": "assets/m5.png", "text": "Gunaah..."},
  {"image": "assets/m1.png", "text": "Master..."},
  {"image": "assets/m5.png", "text": "Gunaah..."},
  {"image": "assets/m1.png", "text": "Master..."},
];

List<Video> vid = cont.map((e) => Video(e['image'], e['text'])).toList();

class Video1 {
  String? image;
  String? text;
  Video1(this.image, this.text);
}


var cont1 = [
  {"image": "assets/m4.png", "text": "ARM..."},
  {"image": "assets/m5.png", "text": "Gunaah..."},
  {"image": "assets/m1.png", "text": "Master..."},
  {"image": "assets/m4.png", "text": "ARM..."},
  {"image": "assets/m5.png", "text": "Gunaah..."},
  {"image": "assets/m1.png", "text": "Master..."},
];

List<Video> vido = cont1.map((e) => Video(e['image'], e['text'])).toList();
