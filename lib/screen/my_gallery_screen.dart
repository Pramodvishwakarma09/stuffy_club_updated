import 'dart:convert';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stuffy_club/helper/AppColor.dart';
import 'package:stuffy_club/screen/my_friend_gallery_screen.dart';
import 'package:stuffy_club/screen/share_friend_list_screen.dart';
import 'get_all_friend_screen.dart';
import 'product_deatails.dart';
import 't_c_screen.dart';
import '../models/pramod_model.dart';
import '../const.dart';

class MyGalleryScreen extends StatefulWidget {
  const MyGalleryScreen({Key? key}) : super(key: key);

  @override
  State<MyGalleryScreen> createState() => _MyGalleryScreenState();
}

class _MyGalleryScreenState extends State<MyGalleryScreen> {
  Map? data;
  Future<PramodModel> fechData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var stringValue = prefs.getInt('user_id');
    PramodModel bm;
    String url = "${AppUrl.baseUrl}/getgallery";
    http.Response response = await http
        .post(Uri.parse(url), body: {"user_id": stringValue.toString()});

    Map<String, dynamic> jsonresponse = jsonDecode(response.body);
    print(jsonresponse.toString());
    bm = PramodModel.fromJson(jsonresponse);
    print(jsonresponse.toString());
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
          iconTheme: IconThemeData(
            size: 30,//change size on your need
            color: Colors.black,//change color on your need
          ),
          centerTitle: true,
          elevation: 0.5,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            'My Gallery',
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'Aboshi',
                fontWeight: FontWeight.w400,
                color: HexColor('#000000'),
                height: 2),
          ),
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
                              builder: (context) => ShareFriendListScreen(),
                            ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Share              ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Aboshi',
                            )),
                      ),
                    )),
                PopupMenuItem<int>(
                    value: 0,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyFriendGalleryScreen(),
                            ));
                      },
                      child: Text("My Friend gallery",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Aboshi',
                          )),
                    )),


              ];
            },),
          ]),

      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(bottom: 20, right: 10),
      //   child: FloatingActionButton(
      //       child: Icon(Icons.add),
      //       backgroundColor: appcolor.primary,
      //       onPressed: () {
      //         Navigator.push(context,
      //             MaterialPageRoute(builder: (_) => AddStuffyScreen()));
      //       }),
      // ),
      body: FutureBuilder(
        future: fechData(),
        builder: (context, AsyncSnapshot<PramodModel> snapshot) {
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
                      print("dkghdgsklllllllllllllllll");
                      print("${snapshot.data!.response[index].qrCodeImage}");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDeatailsScreen(
                                imangNAME:"${snapshot.data!.response[index].qrCodeImage}",
                                productId: "${snapshot.data!.response[index].productId}",
                                satus:
                                "${snapshot.data!.response[index].status}",
                                x: snapshot.data!.response[index].images,
                                name:
                                "${snapshot.data!.response[index].productName}",
                                Description:
                                "${snapshot.data!.response[index].description}",
                                images:snapshot.data!.response[index]
                                        .images[0].imageNames
                                        .toString(),
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
                                    image: NetworkImage( snapshot.data!.response[index]
                                              .images[0].imageNames
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
                            snapshot.data!.response[index].productName
                                .toString(),
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Aboshi',
                                overflow: TextOverflow.ellipsis)),
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            snapshot.data!.response[index].productName,
                            maxLines: 1,
                            style: TextStyle(
                                color: HexColor('#03A9D6'),
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                overflow: TextOverflow.ellipsis),
                          ),
                        )
                      ]),
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(color: appcolor.primary),
            );
          }
        },
      ),
    );
  }
}
