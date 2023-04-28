import 'package:hexcolor/hexcolor.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constants/colors.dart';
import '../Auth/login_screen.dart';
import 'Onboarding2.dart';



class Itro1 extends StatefulWidget {
  const Itro1({Key? key}) : super(key: key);


  @override
  State<Itro1> createState() => _Itro1State();
}

class _Itro1State extends State<Itro1> {
  Route createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: HexColor('#03A9D6'),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              color: HexColor('#03A9D6'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 75),
                    //Sizedboxheight(deviceheight(context,15)),
                  Image.asset('asset/new icons/Mask group.png',
                    height: MediaQuery.of(context).size.height/2,
                   width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left:32,top:15,),
                    child: Text('Stuffed Animals'
                        '\nJust For Kids',
                      style: TextStyle(fontSize: 32,
                          fontFamily: 'Aboshi',
                          fontWeight: FontWeight.w400,
                          color: colors.whit),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left:32,top:12,),
                    child: Text('Lorem ipsum dolor sit amet, consectetur'
                        '\nadipiscing elit, sed do eiusmod tempor'
                        '\nincididunt ut labore.',
                      style: TextStyle(fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: HexColor('#E3E3E3')),
                    ),
                  ),],
              ),
            ),
            Positioned(
              top: 28,right: 3,
              child: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(left:32,top:2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(onPressed: () async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setBool("isLogout", true);
                        Navigator.of(context).pushReplacement(createRoute(
                            LoginScreen()));
                      },
                        child: Text('Skip', style: TextStyle(fontSize: 14,
                          fontFamily: 'Annie',
                          fontWeight: FontWeight.w400,
                          color: HexColor('#E3E3E3'),
                        ),
                        ),
                      ),
                      Align(alignment: Alignment.topLeft,)
                      // style: textstylesubtitle2(context)!.copyWith
                      // (color: colorWhite,fontFamily: "Poppins"),)),
                    ],
                  ),
                ),
              ),),
            Positioned(
              bottom: 10,
              child: Container(
                height: MediaQuery.of(context).size.height/5,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.only(left:36,top:60,bottom:5 ,right:32),
                  // padding: EdgeInsets.only(left:36,top:43,bottom:47 ,right:32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     SvgPicture.asset("asset/new icons/Group 1.svg",),

                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              createRoute(
                              Onboarding2())
                          );
                        },
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: colors.whit,
                          child: SvgPicture.asset('asset/new icons/Circle.svg'),),
                        ),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

