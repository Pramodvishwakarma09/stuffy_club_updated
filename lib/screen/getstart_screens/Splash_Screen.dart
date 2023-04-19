import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stuffy_club/screen/auth/login_screen.dart';

import '../bottombar_screen.dart';
import 'OnBoardingX.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    getValuesSF() ;
  }
  getValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool('isLoggedIn') ?? false;
    SharedPreferences prefs2 = await SharedPreferences.getInstance();
    var status2 = prefs.getBool('isLogout') ?? false;
    print("_____________$status");
    Timer(
      Duration(seconds: 3),
          () {
        status
            ? Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                BottomBar_Screen()
            )
        )
            : status2 ?   Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                LoginScreen()
            )
        ) :  Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    Itro1()
            )
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWeight = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
            height: deviceHeight,
            width: deviceWeight,
            child: Stack(
                children: [
                  Container(
                    height: deviceHeight,
                    width: deviceWeight,
                    child: Image.asset('asset/images/kelsey-todd.png',fit: BoxFit.fill,),
                  ),
                  Container(
                   // height: 8,
                    //width:25 ,
                   // padding: EdgeInsets.only(top:36, left:60,),
                    child:Center(
                      child: Image.asset('asset/new icons/logo.png',scale:2,
                        fit: BoxFit.cover,
                        height: 88,
                        width: 285,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ]
            )
        )
    );
  }
}