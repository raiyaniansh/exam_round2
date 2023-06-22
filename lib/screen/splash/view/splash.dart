import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Get.offAndToNamed('/home');
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        body: Center(
          child:Image.network("https://dwglogo.com/wp-content/uploads/2016/02/Amazoncom-yellow-arrow.png",color: Colors.white),
        ),
      ),
    );
  }
}
