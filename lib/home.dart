import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:video/play.dart';
import 'package:video/watch.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop(); // 👈 closes entire app
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Carousel
              SizedBox(
                height: 255,
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=>Play()),(route)=>false);
                  },
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 255,
                      viewportFraction: 1.0,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _index = index;
                        });
                      },
                    ),
                    itemCount: img.length,
                    itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                      return SizedBox(
                        height: 255,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 200,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(img[itemIndex].image ?? ''),
      
                                  fit: BoxFit.fill  ,
      
                                ),
                              ),
                            ),
                         SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Center(
                                child: Text(
                                  img[itemIndex].text ?? '',
                                  style: const TextStyle(color: Colors.white, fontSize: 13),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
      
              // Watch Now Button
      
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=> Play()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 18),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.play_arrow, color: Colors.white),
                    SizedBox(width: 8),
                    Text("Watch Now", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
      
              // Dots Indicator
          SizedBox(height: 12),
              DotsIndicator(
                dotsCount: img.length,
                position: _index.toDouble(),
                decorator: DotsDecorator(
                  color: Colors.grey,
                  activeColor: Colors.white,
                  size: Size(6.0, 6.0),
                  activeSize: Size(10.0, 10.0),
                ),
              ),
             SizedBox(height: 5),
              // Continue watching
              Align(
                alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Continue Watching for You",
                      style: TextStyle(color: Colors.white,fontSize: 18),),
                  )),
              SizedBox(height: 5),
              SizedBox(
                height: 125,
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>Play()));
                  },
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
              ),
      
              // Latest Realse
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Latest Releases",
                      style: TextStyle(color: Colors.white,fontSize: 18),),
                  )),
              SizedBox(height: 5),
              SizedBox(
                height: 200,
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>Play()));
                  },
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
              ),
              // Top Rated on IMDb
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Top Rated on IMDb",
                      style: TextStyle(color: Colors.white,fontSize: 18),),
                  )),
              SizedBox(height: 5),
              SizedBox(
                height: 200,
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>Play()));
                  },
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
              ),
              // Non Stop Sports
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Non-Stop Sports",
                      style: TextStyle(color: Colors.white,fontSize: 18),),
                  )),
              SizedBox(height: 5),
              SizedBox(
                height: 125,
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>Play()));
                  },
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
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
                                    image: AssetImage("assets/m.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                child: Text("Hotstar",
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
              ),
      
      
            ],
          ),
        ),
      ),
    );
  }
}

// Model class
class Imag {
  String? image;
  String? text;
  Imag(this.image, this.text);
}

// Data
var movie = [
  {"image": "assets/m.png", "text": "• Free for 1 month • Subscription ₹299"},
  {"image": "assets/sport.png", "text": "• 5 Languages • Sports • Live Cricket"},
  {"image": "assets/m1.png", "text": "• 3 Languages • Movie • Action"},
  {"image": "assets/m2.png", "text": "• 4 Languages • Movie • Action & Thriller"},
  {"image": "assets/m.png", "text": "• Free for 1 month • Subscription ₹299"},
];

List<Imag> img = movie.map((e) => Imag(e['image'], e['text'])).toList();

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

