import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:core';
import 'Screens/getstart_screens/Splash_Screen.dart';




Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(

      debugShowCheckedModeBanner: false,
      home: SplashScreen()),
 );
}



