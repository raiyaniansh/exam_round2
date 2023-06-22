import 'package:exam_round2/screen/home/controller/home_controller.dart';
import 'package:exam_round2/utils/api_hepler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    homeController.Apicall();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else if (snapshot.hasData) {
                  return Obx(
                    () => Container(
                      child: homeController.i == 10
                          ? Container(
                              alignment: Alignment.center,
                              child: Container(
                                height: 50.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.circular(25)),
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    Text("You Total Score",style: TextStyle(fontSize: 35.sp,fontWeight: FontWeight.bold)),
                                    SizedBox(height: 8.h,),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "${homeController.truean}",
                                          style: TextStyle(
                                              fontSize: 50.sp, color: Colors.black),
                                        ),
                                        Text(
                                          " Point",
                                          style: TextStyle(
                                              fontSize: 50.sp, color: Colors.black87),
                                        ),
                                      ],
                                    ),
                                    Expanded(child: SizedBox()),
                                    ElevatedButton(onPressed: () {
                                      homeController.userans.clear();
                                      homeController.truean.value=0;
                                      homeController.data!.value.clear();
                                      homeController.answer.clear();
                                      Get.offAndToNamed('/home');
                                    },style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blueGrey.shade900)),child: Text("Restart",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),)),
                                    TextButton(onPressed: () {
                                      print(homeController.answer);
                                      Get.toNamed('/ans');
                                    }, child: Text("Show your answer",style: TextStyle(color: Colors.blueGrey.shade900),))
                                  ],
                                ),
                              ),
                            )
                          : Container(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(child: SizedBox()),
                                  Obx(
                                    () => Text(
                                        "Question ${homeController.i.value + 1} / ${homeController.data!.length}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 25.sp)),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Container(
                                    height: 80.h,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    padding: EdgeInsets.all(15),
                                    child: Column(
                                      children: [
                                        Obx(
                                          () => Text(
                                            "${homeController.data![homeController.i.value].question}",
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            homeController.userans.add("${homeController.answer[0]}");
                                            homeController.changei();
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            width: 90.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.black26)),
                                            child: Row(
                                              children: [
                                                Text("A.",
                                                    style: TextStyle(
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                SizedBox(
                                                  width: 1.w,
                                                ),
                                                Obx(
                                                  () => Text(
                                                    overflow: TextOverflow.ellipsis,
                                                      "${homeController.answer[0]}",
                                                      style: TextStyle(
                                                          fontSize: 15.sp,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            homeController.userans.add("${homeController.answer[1]}");
                                            homeController.changei();
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            width: 90.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.black26)),
                                            child: Row(
                                              children: [
                                                Text("B.",
                                                    style: TextStyle(
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                SizedBox(
                                                  width: 1.w,
                                                ),
                                                Obx(
                                                  () => Text(
                                                      overflow: TextOverflow.ellipsis,
                                                      "${homeController.answer[1]}",
                                                      style: TextStyle(
                                                          fontSize: 15.sp,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            homeController.userans.add(
                                                "${homeController.answer[2]}");
                                            homeController.changei();
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            width: 90.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.black26)),
                                            child: Row(
                                              children: [
                                                Text("C.",
                                                    style: TextStyle(
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                SizedBox(
                                                  width: 1.w,
                                                ),
                                                Obx(
                                                  () => Text(
                                                      overflow: TextOverflow.ellipsis,
                                                      "${homeController.answer[2]}",
                                                      style: TextStyle(
                                                          fontSize: 15.sp,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            homeController.userans.add(
                                                "${homeController.answer[3]}");
                                            homeController.changei();
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            width: 90.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.black26)),
                                            child: Row(
                                              children: [
                                                Text("D.",
                                                    style: TextStyle(
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                SizedBox(
                                                  width: 1.w,
                                                ),
                                                Obx(
                                                  () => Text(
                                                      overflow: TextOverflow.ellipsis,
                                                      "${homeController.answer[3]}",
                                                      style: TextStyle(
                                                          fontSize: 15.sp,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(child: SizedBox())
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ),
                  );
                }
                return Center(child: CircularProgressIndicator(color: Colors.white,));
              },
              future: ApiHelper().Data(),
            )),
      ),
    );
  }
}
