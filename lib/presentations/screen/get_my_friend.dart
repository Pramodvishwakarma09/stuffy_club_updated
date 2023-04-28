import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/models/get_my_friend_model.dart';
import '../../utils/constants/appurls.dart';
import 'package:hexcolor/hexcolor.dart';
import '../widgets/app_bar.dart';

class MyFriendScreen extends StatefulWidget {
  const MyFriendScreen({Key? key}) : super(key: key);

  @override
  State<MyFriendScreen> createState() => _MyFriendScreenState();
}

class _MyFriendScreenState extends State<MyFriendScreen> {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("My Friends", context),
      body: FutureBuilder(
          future: fechData(),
          builder: (context, AsyncSnapshot<GetMyFriendModel> snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.myFriends.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: SizedBox(
                              height: 60,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(width: 10,),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: HexColor('#03A9D6')),
                                        shape: BoxShape.circle),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      child: FadeInImage(
                                          fadeInDuration: const Duration(
                                              milliseconds: 500),
                                          fadeInCurve: Curves.easeInExpo,
                                          fadeOutCurve: Curves.easeOutExpo,
                                          placeholder: const AssetImage(
                                            "asset/images/demoprofile.png",
                                          ),
                                          image: NetworkImage(snapshot.data!.myFriends[index].profileImage,),
                                          imageErrorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.asset(
                                                "asset/images/demoprofile.png");
                                          },
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 40,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data!.myFriends[index].friendName,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
