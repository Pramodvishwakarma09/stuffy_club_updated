import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:stuffy_club/screen/my_gallery_screen.dart';
import 'my_stuffy_screen.dart';
import 'bottombar_screen.dart';
import '../const.dart';
import '../const.dart';

class TestPage extends StatefulWidget {
  var product_id2;
   TestPage({Key? key, required this.product_id2}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
   void loginwithEmail() async {
     print("@@@@@@@@@@@sfsdfdsfsdfsdf");

     try {
       print({widget.product_id2});
       SharedPreferences prefs = await SharedPreferences.getInstance();
       var stringValue = prefs.getInt('user_id');
       final response = await http.post(
         Uri.parse("${AppUrl.baseUrl}/addgallery"),
         body: { "product_id" : "${widget.product_id2}",
           "user_id": stringValue.toString(),
         },
       );
       if (response.statusCode == 200) {
         var data = jsonDecode(response.body);
         bool login = data['success'];


         if (login) {
           Navigator.pushReplacement(
             context,
             MaterialPageRoute(builder: (context) => MyGalleryScreen()),
           );
         } else {

           Fluttertoast.showToast(
             msg: data["message"],
             toastLength: Toast.LENGTH_LONG,
             //duration
             gravity: ToastGravity.TOP,
             //location
             timeInSecForIosWeb: 1,
             backgroundColor: Colors.red,
             //background color
             textColor: Colors.white,
             //text Color
             fontSize: 16.0,
             //font size
           );
           Navigator.push(
             context,
             MaterialPageRoute(builder: (context) => MyStuffyScreen()),
           );

         }
       }


      } catch (e) {

       setState(() {

         Fluttertoast.showToast(
           msg: "verify user",
           toastLength: Toast.LENGTH_LONG,
           //duration
           gravity: ToastGravity.TOP,
           //location
           timeInSecForIosWeb: 1,
           backgroundColor: Colors.red,
           //background color
           textColor: Colors.white,
           //text Color
           fontSize: 16.0,
           //font size
         );
         print(
             "------------------------------------------------------------------");
         print("@@@@@@@@@@@@@@@@@@@${e}");
       });
       print(e.toString());
     }
   }
  @override
  // ignore: must_call_super
  initState() {
    // ignore: avoid_print

    // fechData();
    loginwithEmail();
  }

   @override
  Widget build(BuildContext context) {
    return  Scaffold(
           body: Center(child: CircularProgressIndicator()),
    );
  }
}


