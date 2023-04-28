import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../utils/constants/colors.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/constants/appurls.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../domain/models/get_my_friend_model.dart';

class ShareFriendListScreen extends StatefulWidget {
  const ShareFriendListScreen({Key? key}) : super(key: key);
  @override
  State<ShareFriendListScreen> createState() => _ShareFriendListScreenState();
}

class _ShareFriendListScreenState extends State<ShareFriendListScreen> {
  Future<GetMyFriendModel> fechData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var stringValue = prefs.getInt('user_id');
    GetMyFriendModel bm;
    String url = AppUrl.get_my_friend;
    http.Response response = await http
        .post(Uri.parse(url), body: {"user_id": stringValue.toString()});

    Map<String, dynamic> jsonresponse = jsonDecode(response.body);
    bm = GetMyFriendModel.fromJson(jsonresponse);
    return bm;
  }

  Future<void> addFriend(String friend_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var stringValue = prefs.getInt('user_id');
    String url = AppUrl.share_my_gallery;
    http.Response response = await http.post(Uri.parse(url),
        body: {"user_id": stringValue.toString(), "friend_id": "$friend_id"});

    var data = jsonDecode(response.body);

    var msg = data["message"];
    Fluttertoast.showToast(
      msg: "$msg",
      toastLength: Toast.LENGTH_LONG,
      //duration
      gravity: ToastGravity.BOTTOM,
      //location
      timeInSecForIosWeb: 1,
      backgroundColor: colors.primary,
      //background color
      textColor: Colors.white,
      //text Color
      fontSize: 16.0,
      //font size
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          size: 25, //change size on your need
          color: Colors.black, //change color on your need
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "Share ",
          style: TextStyle(
              fontSize: 18,
              fontFamily: 'Aboshi',
              fontWeight: FontWeight.w400,
              color: colors.black1,
              height: 2),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: colors.black1,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: FutureBuilder(
          future: fechData(),
          builder: (context, AsyncSnapshot<GetMyFriendModel> snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.myFriends.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                          child: Card(
                            child: Container(
                              height: 60,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: HexColor('#03A9D6')),
                                          shape: BoxShape.circle),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        child: FadeInImage(
                                            fadeInDuration: const Duration(
                                                milliseconds: 500),
                                            fadeInCurve: Curves.easeInExpo,
                                            fadeOutCurve: Curves.easeOutExpo,
                                            placeholder: AssetImage(
                                              "asset/images/demoprofile.png",
                                            ),
                                            image: NetworkImage(
                                              "${AppUrl.baseUrl}/profile/" +
                                                  snapshot
                                                      .data!
                                                      .myFriends[index]
                                                      .profileImage
                                                      .toString(),
                                            ),
                                            imageErrorBuilder:
                                                (context, error, stackTrace) {
                                              return Container(
                                                  child: Image.asset(
                                                      "asset/images/demoprofile.png"));
                                            },
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Text(
                                      "${snapshot.data!.myFriends[index].friendName}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Spacer(),
                                    InkWell(
                                      onTap: () {
                                        addFriend(
                                            "${snapshot.data!.myFriends[index].friendId}");
                                        Navigator.pop(context);
                                        setState(() {});
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                              color: colors.primary),
                                        ),
                                        height: 20,
                                        width: 52,
                                        child: Center(
                                            child: Text(
                                          "Share",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 8),
                                        )),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
