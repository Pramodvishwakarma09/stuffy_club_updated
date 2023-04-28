import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stuffy_club/presentations/widgets/app_bar.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
import '../../domain/models/get_all_friend_model.dart';
import '../../domain/models/notifaction_model.dart';
import '../../utils/constants/appurls.dart';
import '../../utils/constants/colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  Future<NotoficationModel> loadAssets() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var stringValue = prefs.getInt('user_id');
    NotoficationModel lm;
    String url = AppUrl.getallnotification;
    http.Response response =
    await http.post(Uri.parse(url), body: {"user_id": "$stringValue"});
    Map<String, dynamic> jsonresponse = jsonDecode(response.body);
    lm = NotoficationModel.fromJson(jsonresponse);
    return lm;
  }
  Future<void> addFriend(String friend_id  , int satus) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var stringValue = prefs.getInt('user_id');
    GetAllFriendModel bm;
    String url = AppUrl.add_friend;
    http.Response response = await http.post(Uri.parse(url),
        body: {"reciver_id": stringValue.toString(), "sender_id": friend_id,"status" : satus.toString()});
    var data = jsonDecode(response.body);
    var msg =data["message"];
    Fluttertoast.showToast(
      msg: "$msg",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: colors.primary,
      textColor: Colors.white,
      fontSize: 16.0,
    );



    Map<String, dynamic> jsonresponse = jsonDecode(response.body);
    bm = GetAllFriendModel.fromJson(jsonresponse);
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
        appBar: customAppBar("Notifications", context),
      body: FutureBuilder(
        future: loadAssets(),
        builder: (context, AsyncSnapshot<NotoficationModel> snapshot) {
          if (snapshot.hasData) {
            if(snapshot.data!.response.length==0){
              return Center(child: Text("No Notification available"),);
            }else{
              return ListView.builder(
                  itemCount: snapshot.data!.response.length,
                  padding: const EdgeInsets.only(top: 29),
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0, left: 20,bottom: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${snapshot.data!.response[index].body}", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                            SizedBox(height: 10.h,),
                            "${snapshot.data!.response[index].friendRequestStatus}" == "0" ?
                            Row(
                              children: [
                                SizedBox(width: 140.w,),
                                SizedBox(
                                  height: 30,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        addFriend("${snapshot.data!.response[index].senderId}", 1);
                                        setState(() {

                                        });
                                      },
                                      child: Text('Accept'),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.green, // Accept button color
                                        onPrimary: Colors.white, // Accept button text color
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10), // Rounded button corners
                                        ),
                                      )
                                  ),
                                ),
                                SizedBox(width: 10.h,),
                                SizedBox(
                                  height: 30,

                                  child: ElevatedButton(
                                      onPressed: () {
                                        addFriend("${snapshot.data!.response[index].senderId}", 2);
                                        setState(() {

                                        });
                                      },
                                      child: Text('Reject'),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.red.withOpacity(.90), // Accept button color
                                        onPrimary: Colors.white, // Accept button text color
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10), // Rounded button corners
                                        ),
                                      )
                                  ),
                                )
                              ],
                            ) : Container()

                          ],
                        ),
                      ),
                    );
                  });

            }
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






