import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/get_my_friend_model.dart';
import '../const.dart';


class MyFriendScreen extends StatefulWidget {
  const MyFriendScreen({Key? key}) : super(key: key);

  @override
  State<MyFriendScreen> createState() => _MyFriendScreenState();
}

class _MyFriendScreenState extends State<MyFriendScreen> {




  Future<GetMyFriendModel> fechData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var stringValue = prefs.getInt('user_id');
    print("call fetch data");
    GetMyFriendModel bm;
    String url = "${AppUrl.baseUrl}/get_my_friend";
    http.Response response = await http.post(Uri.parse(url),
      body:  {"user_id": stringValue.toString()}
    );
    print( stringValue.toString());
    print(response.body.toString());
    print("222222222222222222");

    Map<String, dynamic> jsonresponse = jsonDecode(response.body);
    bm = GetMyFriendModel.fromJson(jsonresponse);
    return bm;

  }




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          size: 25,//change size on your need
          color: Colors.black,//change color on your need
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text('My Friends', style: TextStyle(fontSize: 18,
            fontFamily: 'Aboshi',
            fontWeight: FontWeight.w400,
            color: HexColor('#000000'),
            height: 2),),

        leading: IconButton(icon: Icon(Icons.arrow_back_ios,
          color: HexColor('#000000'),),
            onPressed: () {Navigator.pop(context);}
        ),
        // actions: [
        //   PopupMenuButton(
        //       itemBuilder: (context){
        //         return [
        //           PopupMenuItem<int>(
        //             value: 0,
        //             child: Text("Privacy Policy ",style: TextStyle(
        //               fontSize: 16,fontWeight: FontWeight.w400,fontFamily: 'Aboshi',
        //             )
        //             ),
        //           ),
        //           PopupMenuItem<int>(
        //             value: 1,
        //             child: Text("Terms & Condition",style: TextStyle(
        //               fontSize: 16,fontWeight: FontWeight.w400,fontFamily: 'Aboshi',
        //             )
        //             ),
        //           )
        //         ];
        //       },
        //       onSelected:(value){
        //         if(value == 0){
        //           // Navigator.push(context, MaterialPageRoute(
        //           //     builder: (_)=> Condition())
        //           // );
        //         }else if(value == 1){
        //           print("Settings menu is selected.");
        //         }
        //       }
        //   ),
        // ],
      ),

      body : FutureBuilder(
          future: fechData(),
          builder: (context, AsyncSnapshot<GetMyFriendModel> snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot!.data!.myFriends.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(15,10,15,0),
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

                                        border: Border.all(color: HexColor('#03A9D6')),
                                          shape: BoxShape.circle
                                      ),
                                        child: ClipRRect(

                                          borderRadius: BorderRadius.circular(30.0),
                                          child: FadeInImage(
                                              fadeInDuration: const Duration(milliseconds: 500),
                                              fadeInCurve: Curves.easeInExpo,
                                              fadeOutCurve: Curves.easeOutExpo,
                                              placeholder: AssetImage(
                                                "asset/images/demoprofile.png",
                                              ),
                                              image: NetworkImage(
                                                "${AppUrl.baseUrl}/profile/" +
                                                    snapshot.data!.myFriends[index].profileImage.toString(),
                                              ),
                                              imageErrorBuilder: (context, error, stackTrace) {
                                                return Container(
                                                    child: Image.asset(
                                                        "asset/images/demoprofile.png"));
                                              },
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      SizedBox(width: 40,),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,

                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("${snapshot.data!.myFriends[index].friendName}",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                          SizedBox(height: 10,),

                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },),
                    )
                  ],
                ),
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
