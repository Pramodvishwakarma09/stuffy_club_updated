import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stuffy_club/screen/get_all_friend_screen.dart';
import 'package:stuffy_club/screen/get_my_friend.dart';
import 'package:stuffy_club/screen/getstart_screens/Splash_Screen.dart';
import 'dart:core';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(GetMaterialApp(

      debugShowCheckedModeBanner: false,
      home: SplashScreen()),
 );
}



