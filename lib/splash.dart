import 'dart:async';
import 'package:flutter/material.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  double _opacity = 0.0;
  double _scale = 0.8;

  @override
  void initState() {
    super.initState();

    Timer(Duration(milliseconds: 300), () {
      setState(() {
        _opacity = 1.0;
        _scale = 1.0;
      });
    });

    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Home()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // 🔵 Logo Animation
            AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(milliseconds: 1500),
              child: AnimatedScale(
                scale: _scale,
                duration: Duration(milliseconds: 1500),
                curve: Curves.easeInOutBack,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/splash2.png',
                      width: 250,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
