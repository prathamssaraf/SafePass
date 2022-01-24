// ignore_for_file: unnecessary_new

import 'dart:async';
import 'dart:io';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:safepass/log_in/login_page.dart';

// final List<Image> images = [
//   Image.asset("assets/images/openingscreen/openingscreen.png"),
//   Image.asset("assets/images/openingscreen/openingscreen2.png"),
//   Image.asset("assets/images/openingscreen/openingscreen3.png"),
// ];

class OpeningScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => LoginPage())));

    return Material(
      color: Colors.black,
      child: Column(
        children: [
          const SizedBox(
            height: 85,
          ),
          const Text(
            "SafePass",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: "ProximaSoft",
              fontSize: 55,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "Welcome to SafePass.",
            style: TextStyle(
              color: Colors.white60,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 45,
          ),
          Center(
            child: Image.asset(
              "assets/images/openingscreen2.png",
              height: 370,
            ),
          ),

          const SizedBox(
            height: 50,
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: ElevatedButton(
          //     onPressed: () {
          //       Navigator.pushNamedAndRemoveUntil(
          //           context, 'login', (route) => false);
          //     },
          //     child: const Text('Continue'),
          //     style: ElevatedButton.styleFrom(
          //       primary: Colors.teal[300],
          //       textStyle: const TextStyle(
          //           fontSize: 23,
          //           fontWeight: FontWeight.bold,
          //           fontFamily: "ProximaSoft"),
          //       padding:
          //           const EdgeInsets.symmetric(horizontal: 115, vertical: 17),
          //       shape: new RoundedRectangleBorder(
          //         borderRadius: new BorderRadius.circular(
          //           20,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),

          const SizedBox(
            height: 15,
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.pushNamed(
          //       context,
          //       "/signup",
          //     );
          //   },
          //   child: Text('Sign Up'),
          //   style: ElevatedButton.styleFrom(
          //     primary: Colors.teal[300],
          //     textStyle: TextStyle(
          //         fontSize: 23,
          //         fontWeight: FontWeight.bold,
          //         fontFamily: "ProximaSoft"),
          //     padding: EdgeInsets.symmetric(horizontal: 100, vertical: 17),
          //     shape: new RoundedRectangleBorder(
          //       borderRadius: new BorderRadius.circular(
          //         20,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
