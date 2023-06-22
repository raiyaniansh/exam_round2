import 'package:exam_round2/screen/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AnswerScreen extends StatefulWidget {
  const AnswerScreen({Key? key}) : super(key: key);

  @override
  State<AnswerScreen> createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.blueGrey.shade900,
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Your Solustion",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w600)),
                SizedBox(
                  height: 2.h,
                ),
                Expanded(
                  child: ListView.builder(
                      itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                                color: homeController.userans[index] ==
                                        homeController
                                            .data![index].correctAnswer
                                    ? Colors.green.withOpacity(0.20)
                                    : Colors.red.withOpacity(0.20),
                                borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(10),
                        child: Text("${homeController.userans[index]}",style: TextStyle( color: homeController.userans[index] ==
                            homeController
                                .data![index].correctAnswer
                            ? Colors.green
                            : Colors.red,),),
                          ),
                      itemCount: homeController.userans.length),
                ),
              ],
            ),
          )),
    );
  }
}
