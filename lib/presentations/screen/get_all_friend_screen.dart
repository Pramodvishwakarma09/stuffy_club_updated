import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../utils/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../domain/models/get_all_friend_model.dart';
import 'get_my_friend.dart';
import '../../utils/constants/appurls.dart';
import 'package:hexcolor/hexcolor.dart';

class GetallFrindScreen extends StatefulWidget {
  const GetallFrindScreen({Key? key}) : super(key: key);

  @override
  State<GetallFrindScreen> createState() => _GetallFrindScreenState();
}

class _GetallFrindScreenState extends State<GetallFrindScreen> {

  bool isLoading = false;
  var  selectedIndex ;

  Future<GetAllFriendModel> fechData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var stringValue = prefs.getInt('user_id');

    GetAllFriendModel bm;
    String url = AppUrl.get_all_friends;
    http.Response response = await http
        .post(Uri.parse(url), body: {"user_id": stringValue.toString()});

    Map<String, dynamic> jsonresponse = jsonDecode(response.body);
    bm = GetAllFriendModel.fromJson(jsonresponse);
    return bm;
  }

  Future<void> friend_request(String friend_id) async {

    setState(() {
      isLoading=true;
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var stringValue = prefs.getInt('user_id');
    GetAllFriendModel bm;
    String url = AppUrl.friend_request;
    http.Response response = await http.post(Uri.parse(url),
        body: {"sender_id": stringValue.toString(), "reciver_id": friend_id});
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

            } else if (value == 1) {

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
                      itemCount: snapshot!.data!.myFriends.length,
                      itemBuilder: (context, index) {
                       if(selectedIndex==index){
                         return  Card(
                           child: Container(
                             decoration: BoxDecoration(
                                 color: Color(0xffF5F5F5),
                                 border: Border.all(color: Colors.white12)
                             ),
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
                                                 snapshot.data!.myFriends[index].profileImage.toString(),
                                               ),
                                               imageErrorBuilder:
                                                   (context, error, stackTrace) {
                                                 return Container(
                                                     height: 50,
                                                     width: 50,
                                                     child: Image.asset("asset/images/demoprofile.png"));
                                               },
                                               fit: BoxFit.cover),
                                         ),
                                       ),
                                       Container(
                                         decoration: BoxDecoration(
                                           borderRadius:
                                           BorderRadius.circular(30),
                                           border: Border.all(
                                               color: colors.primary),
                                         ),
                                         height: 20,
                                         width: 52,
                                         child: Center(
                                             child: Container(height: 18,width: 18,child: CircularProgressIndicator(color: colors.primary,strokeWidth: 1.5),)
                                         ),
                                       ),
                                     ],
                                   ),
                                   SizedBox(
                                     height: 9,
                                   ),
                                   Text(
                                     snapshot.data!.myFriends[index].fullName,
                                     style: TextStyle(
                                         fontWeight: FontWeight.w400,
                                         fontSize: 14),
                                   ),
                                 ],
                               ),
                             ),
                           ),
                         );
                       } else{
                         return   Card(
                           child: Container(
                             decoration: BoxDecoration(
                                 color: Color(0xffF5F5F5),
                                 border: Border.all(color: Colors.white12)
                             ),
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
                                                 snapshot.data!.myFriends[index].profileImage.toString(),
                                               ),
                                               imageErrorBuilder:
                                                   (context, error, stackTrace) {
                                                 return Container(
                                                     height: 50,
                                                     width: 50,
                                                     child: Image.asset("asset/images/demoprofile.png"));
                                               },
                                               fit: BoxFit.cover),
                                         ),
                                       ),
                                       InkWell(
                                         onTap: () {

                                           friend_request("${snapshot.data!.myFriends[index].id}");
                                           print(("${snapshot.data!.myFriends[index].id}"));
                                           setState(() {
                                             selectedIndex=index;
                                           });
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
                                     snapshot.data!.myFriends[index].fullName,
                                     style: TextStyle(
                                         fontWeight: FontWeight.w400,
                                         fontSize: 14),
                                   ),
                                 ],
                               ),
                             ),
                           ),
                         );
                       }
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
