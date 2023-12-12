// ignore_for_file: prefer_const_constructors, camel_case_types, duplicate_ignore, dead_code

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';

class onboarding extends StatefulWidget {
  const onboarding({super.key});

  @override
  State<onboarding> createState() => _onboardingState();
}

// ignore: camel_case_types
class _onboardingState extends State<onboarding> {
  PageController controller = PageController(initialPage: 0);
  List onboarding = [
    {
      'heading': 'Boost Productivity',
      'subheading':
          'Foc.io helps you boost your productivity on a differnet level',
      'image': 'assets/p1.png'
    },
    {
      'heading': 'Work Seamlessly',
      'subheading': 'Get your work done seamlessly without interruption',
      'image': 'assets/p2.png'
    },
    {
      'heading': 'Achieve Higher Goals',
      'subheading':
          'By boosting your producivity\n we help you achieve higher goals',
      'image': 'assets/p3.png'
    }
  ];
  int currentpage = 0;

  Widget animationDo(
    int index,
    int delay,
    Widget child,
  ) {
    if (index == 1) {
      return FadeInDown(
        delay: Duration(milliseconds: delay),
        child: child,
      );
    }
    return FadeInUp(
      delay: Duration(milliseconds: delay),
      child: child,
    );
  }
  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: 8.0,
      width: isActive ? 30.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i <= 2; i++) {
      list.add(i == currentpage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    double h = Get.height;
    double w = Get.width;
    return Scaffold(
      backgroundColor: Color(0xFF221F1E),
      body: Stack(
        children: [
          PageView.builder(
              itemCount: onboarding.length,
              controller: controller,
              scrollDirection: Axis.horizontal,
              // physics: const BouncingScrollPhysics(),
              onPageChanged: (int index) {
                setState(() {
                  currentpage = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * .1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      animationDo(
                          index, 10, Image.asset(onboarding[index]['image'])),
                      animationDo(
                        index,
                        10,
                        Text(
                          onboarding[index]['heading'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontFamily: 'Gilroy-Bold',
                            fontWeight: FontWeight.w600,
                            height: 0.05,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: h * .05,
                      ),
                      animationDo(
                        index,
                        10,
                        Text(
                          onboarding[index]['subheading'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Gilroy-Regular',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: h * .05,
                      ),
                      (currentpage == 2)
                          ? animationDo(
                              index,
                              10,
                              GestureDetector(
                                child: Container(
                                  width: w * .35,
                                  height: h * .06,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFEF895F),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'Get Started',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Raleway',
                                      fontWeight: FontWeight.w700,
                                      height: 0.22,
                                    ),
                                  )),
                                ),
                              ),
                            )
                          : animationDo(
                              index,
                              10,
                              GestureDetector(
                                onTap: () {
                                  controller.nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.ease);
                                },
                                child: Container(
                                  width: w * .25,
                                  height: h * .06,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFEF895F),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Next',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w700,
                                        height: 0.22,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      SizedBox(
                        height: h * .03,
                      ),
                     
                  
                      
                  
                  
                    ],
                  ),
                );
              }),
               Padding(
                     padding:  EdgeInsets.only(bottom: h* .1),
                     child: Align(
                      alignment: Alignment.bottomCenter,
                       child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _buildPageIndicator(),
                        ),
                     ),
                   ),
        ],
      ),
    );
  }
}
