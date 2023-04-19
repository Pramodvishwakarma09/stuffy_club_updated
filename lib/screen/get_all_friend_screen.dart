import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stuffy_club/helper/AppColor.dart';
import 'package:http/http.dart' as http;
import '../models/get_all_friend_model.dart';
import 'get_my_friend.dart';
import '../const.dart';

class GetallFrindScreen extends StatefulWidget {
  const GetallFrindScreen({Key? key}) : super(key: key);

  @override
  State<GetallFrindScreen> createState() => _GetallFrindScreenState();
}

class _GetallFrindScreenState extends State<GetallFrindScreen> {

  Future<GetAllFriendModel> fechData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var stringValue = prefs.getInt('user_id');
    print(stringValue);
    print("dfsdgfhhfhvhrgfdvdvdvvdvvdvhg");
    GetAllFriendModel bm;
    String url = "${AppUrl.baseUrl}/get_all_friends";
    http.Response response = await http
        .post(Uri.parse(url), body: {"user_id": stringValue.toString()});
    print("222222222222222222");
    print(response.body.toString());
    print("222222222222222222");

    Map<String, dynamic> jsonresponse = jsonDecode(response.body);
    bm = GetAllFriendModel.fromJson(jsonresponse);
    return bm;
  }

  Future<void> addFriend(String friend_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var stringValue = prefs.getInt('user_id');
    print(stringValue);
    print("dfsdgfhhfhvhrgfdvdvdvvdvvdvhg");
    GetAllFriendModel bm;
    String url = "${AppUrl.baseUrl}/add_friend";
    http.Response response = await http.post(Uri.parse(url),
        body: {"user_id": stringValue.toString(), "friend_id": "$friend_id"});
    print("############response############");
    print(response.body.toString());
    var data = jsonDecode(response.body);
    print("############jsonDecde333############");
     var msg =data["message"];
    Fluttertoast.showToast(
      msg: "$msg",
      toastLength: Toast.LENGTH_LONG,
      //duration
      gravity: ToastGravity.BOTTOM,
      //location
      timeInSecForIosWeb: 1,
      backgroundColor: appcolor.primary,
      //background color
      textColor: Colors.white,
      //text Color
      fontSize: 16.0,
      //font size
    );



    Map<String, dynamic> jsonresponse = jsonDecode(response.body);
    bm = GetAllFriendModel.fromJson(jsonresponse);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fechData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          size: 25,//change size on your need
          color: Colors.black,//change color on your need
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Add Friends',
          style: TextStyle(
              fontSize: 18,
              fontFamily: 'Aboshi',
              fontWeight: FontWeight.w400,
              color: HexColor('#000000'),
              height: 2),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: HexColor('#000000'),
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem<int>(
                value: 0,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyFriendScreen(),
                        ));
                  },
                  child: Text("My Friend",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Aboshi',
                      )),
                ),
              ),
            ];
          }, onSelected: (value) {
            if (value == 0) {
              // Navigator.push(context, MaterialPageRoute(
              //     builder: (_)=> Condition())
              // );
            } else if (value == 1) {
              print("Settings menu is selected.");
            }
          }),
        ],
      ),
      body: Container(
        child: FutureBuilder(
            future: fechData(),
            builder: (context, AsyncSnapshot<GetAllFriendModel> snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 2.76),
                          crossAxisCount: 2),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot!.data!.friendList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xffF5F5F5),
                              border: Border.all(color: Colors.white12)
                            ),

                            // width: 150,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                              height: 50,
                                              width: 50,
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
                                                        .friendList[index]
                                                        .profileImage
                                                        .toString(),
                                              ),
                                              imageErrorBuilder:
                                                  (context, error, stackTrace) {
                                                return Container(
                                                    height: 50,
                                                    width: 50,
                                                    child: Image.asset(
                                                        "asset/images/demoprofile.png"));
                                              },
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          addFriend("${snapshot.data!.friendList[index].id}");
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    MyFriendScreen(),
                                              ));
                                          setState(() {

                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            border: Border.all(
                                                color: appcolor.primary),
                                          ),
                                          height: 20,
                                          width: 52,
                                          child: Center(
                                              child: Text(
                                            "Add",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 8),
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 9,
                                  ),
                                  Text(
                                    "${snapshot.data!.friendList[index].fullName}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
