import 'dart:convert';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
  import '../../domain/models/my_friend_gallery_model.dart';
import 'my_friend_galley_open_screen.dart';
import '../../utils/constants/appurls.dart';
import 'package:hexcolor/hexcolor.dart';

class MyFriendGalleryScreen extends StatefulWidget {
  const MyFriendGalleryScreen({Key? key}) : super(key: key);

  @override
  State<MyFriendGalleryScreen> createState() => _MyFriendGalleryScreenState();
}

class _MyFriendGalleryScreenState extends State<MyFriendGalleryScreen> {
  Map? data;
  Future<MyFriendGalleryModel> fechData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var stringValue = prefs.getInt('user_id');
    MyFriendGalleryModel bm;
    String url = AppUrl.get_share_gallery;
    http.Response response = await http
        .post(Uri.parse(url), body: {"user_id": stringValue.toString()});

    Map<String, dynamic> jsonresponse = jsonDecode(response.body);

    bm = MyFriendGalleryModel.fromJson(jsonresponse);

    return bm;
  }

  @override
  void initState() {
    fechData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(
            size: 30,//change size on your need
            color: Colors.black,//change color on your need
          ),
          centerTitle: true,
          elevation: 0.5,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: const Text(
            'My Friend Gallery',
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'Aboshi',
                fontWeight: FontWeight.w400,
                color: colors.black1,
                height: 2),
          ),
          // actions: [
          //   PopupMenuButton(itemBuilder: (context) {
          //     return [
          //       PopupMenuItem<int>(
          //           value: 0,
          //           child: InkWell(
          //             onTap: () {
          //               Navigator.push(
          //                   context,
          //                   MaterialPageRoute(
          //                     builder: (context) => const ShareFriendListScreen(),
          //                   ));
          //             },
          //             child: const Text("Share",
          //                 style: TextStyle(
          //                   fontSize: 16,
          //                   fontWeight: FontWeight.w400,
          //                   fontFamily: 'Aboshi',
          //                 )),
          //           )),
          //
          //     ];
          //   },),
          // ]
      ),

      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(bottom: 20, right: 10),
      //   child: FloatingActionButton(
      //       child: Icon(Icons.add),
      //       backgroundColor: colors.primary,
      //       onPressed: () {
      //         Navigator.push(context,
      //             MaterialPageRoute(builder: (_) => AddStuffyScreen()));
      //       }),
      // ),
      body: FutureBuilder(
        future: fechData(),
        builder: (context, AsyncSnapshot<MyFriendGalleryModel> snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                itemCount: snapshot.data!.response.length,
                padding: const EdgeInsets.only(top: 29),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 5 / 6,
                    mainAxisExtent: 120,
                    crossAxisCount: (Orientation.portrait ==
                        MediaQuery.of(context).orientation)
                        ? 3
                        : 0),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyFrinedGalleryDeatialScreen(
                                user_name: "${snapshot.data!.response[index].fullName}",
                             user_id: "${snapshot.data!.response[index].id}",
                              )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Column(children: [
                        Container(
                          width: 709,
                          height: 70,
                          child: Stack(
                            children: [
                              Container(
                                width: 700,
                                height: 70,
                                decoration: BoxDecoration(
                                  //  borderRadius: BorderRadius.circular(15),
                                  shape: BoxShape.circle,
                                  border:
                                  Border.all(color: HexColor('#03A9D6')),
                                  image: DecorationImage(
                                    // fit: BoxFit.cover,
                                    scale: 0.5,
                                    image: NetworkImage( snapshot.data!.response[index].profileImage
                                        .toString(),

                                      // image: NetworkImage(imageusr+Data1![index].images![0].imageNames.toString(),
                                    ),
                                  ),
                                ),
                                alignment: Alignment.center,
                              ),
                              Container(
                                width: 700,
                                height: 70,
                                alignment: Alignment.center,
                                // margin: const EdgeInsets.only(right:20,left: 20),
                                child: DottedBorder(
                                    borderType: BorderType.Circle,
                                    radius: const Radius.circular(79),
                                    dashPattern: const [12, 5],
                                    color: (index % 3 == 0)
                                        ? HexColor('#03A9D6')
                                        : ((index % 3 == 1)
                                        ? Colors.redAccent
                                        : Colors.green),
                                    strokeWidth: 2,
                                    child: Container(
                                      width: 709,
                                      height: 70,
                                    )),
                              )
                            ],
                          ),
                        ),
                        Text(
                            snapshot.data!.response[index].fullName
                                .toString(),
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Aboshi',
                                overflow: TextOverflow.ellipsis)),
                      ]),
                    ),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(color: colors.primary),
            );
          }
        },
      ),
    );
  }
}
