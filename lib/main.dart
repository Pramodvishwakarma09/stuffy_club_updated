import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:stuffy_club/presentations/providers/login_provider.dart';
import 'package:stuffy_club/presentations/screen/getstart_screens/Splash_Screen.dart';
import 'dart:core';


@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
  print("pramod vishwakarma ");
}


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return  MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => LoginProvider()),

            ],
            child: GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Stuffy Club',
              theme: ThemeData(primarySwatch: Colors.blue,),
              home:
              SplashScreen(),
            )
        );
  });
}
}