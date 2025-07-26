import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video/home.dart';
import 'package:video/play.dart';
import 'package:video/provider.dart';
import 'package:video/splash.dart';
import 'package:video/video.dart';
import 'package:video/videoplay.dart';
import 'package:video/watch.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ChangeNotifierProvider(
      create:(_)=> Fav(),
       child: MyApp(),
    )
    );


}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}



