import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:onboard_screens_flutter_sobanqazi69/onboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  // Instagram: soban._.qazi
  // Linkeden :  https://www.linkedin.com/in/soban-rashid-qazi-a98a04241/
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,      
      home: onboarding(),
    );
  }
}

