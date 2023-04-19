
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ndialog/ndialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/notification_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart'as http;

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../models/notifaction_model.dart';
import '../const.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  Future<NotoficationModel> loadAssets() async {
    NotoficationModel lm;
    String url = "${AppUrl.baseUrl}/getallnotification";
    http.Response response =
    await http.post(Uri.parse(url), body: {"user_id": "10"});
    Map<String, dynamic> jsonresponse = jsonDecode(response.body);
    lm = NotoficationModel.fromJson(jsonresponse);
    print(jsonresponse);
    return lm;
  }

  @override
  void initState() {
    loadAssets();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
              centerTitle: true,
             elevation: 1,
             backgroundColor: Theme.of(context).scaffoldBackgroundColor,
             title: Text('Notifications',style: TextStyle(fontSize:18,
                 fontFamily: 'Aboshi', fontWeight: FontWeight.w400,color: HexColor('#000000'),
             height:2),
             ),

             leading: IconButton(
             icon: Icon(
             Icons.arrow_back_ios,
             color: HexColor('#000000'),),
                 onPressed: (){Navigator.pop(context);},
             )),
      body: FutureBuilder(
        future: loadAssets(),
        builder: (context, AsyncSnapshot<NotoficationModel> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.response.length,
                padding: const EdgeInsets.only(top: 29),
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(snapshot.data!.response[index].body.toString()),
                    ),
                  );
                });

          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),


    );
  }
}






