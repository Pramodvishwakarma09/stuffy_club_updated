import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dashboard_page.dart';
import 'my_gallery_screen.dart';
import '../../utils/constants/appurls.dart';

class TestPage extends StatefulWidget {
  var product_id2;
   TestPage({Key? key, required this.product_id2}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
   void loginwithEmail() async {
     try {
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
             msg: "Wrong Qr",
             toastLength: Toast.LENGTH_LONG,
             gravity: ToastGravity.TOP,
             timeInSecForIosWeb: 1,
             backgroundColor: Colors.red,
             textColor: Colors.white,
             fontSize: 16.0,
           );
           Navigator.push(
             context,
             MaterialPageRoute(builder: (context) => DashBoardPage()),
           );

         }
       }


      } catch (e) {

       setState(() {

         Fluttertoast.showToast(
           msg: "verify user",
           toastLength: Toast.LENGTH_LONG,
           gravity: ToastGravity.TOP,
           timeInSecForIosWeb: 1,
           backgroundColor: Colors.red,
           textColor: Colors.white,
           fontSize: 16.0,
         );

       });
       print(e.toString());
     }
   }
  @override
  initState() {
    loginwithEmail();
  }
   @override
  Widget build(BuildContext context) {
    return  Scaffold(
           body: Center(child: CircularProgressIndicator()),
    );
  }
}


