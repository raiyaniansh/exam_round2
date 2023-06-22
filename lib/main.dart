import 'package:exam_round2/screen/answer/view/answer_screen.dart';
import 'package:exam_round2/screen/home/view/home_screen.dart';
import 'package:exam_round2/screen/splash/view/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

main() {
  runApp(Sizer(
    builder: (context, orientation, deviceType) => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/ans', page: () => AnswerScreen()),
      ],
    ),
  ));
}
