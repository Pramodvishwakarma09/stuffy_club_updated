import 'dart:convert';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/models/my_stuffy_model.dart';
import '../../utils/constants/appurls.dart';
import 'get_all_friend_screen.dart';
import 'my_gallery_screen.dart';
import 'my_stuffy_product_deatails_screen.dart';
import 'add_stuffy_screen.dart';
import 'package:hexcolor/hexcolor.dart';

class MyStuffyScreen extends StatefulWidget {
  const MyStuffyScreen({Key? key}) : super(key: key);

  @override
  State<MyStuffyScreen> createState() => _StuffyScreenState();
}

class _StuffyScreenState extends State<MyStuffyScreen> {
  Map? data;
  Future<MyStuffyModel> fechData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var stringValue = prefs.getInt('user_id');
    MyStuffyModel bm;
    String url = AppUrl.getProductsbyuserid;
    http.Response response = await http
        .post(Uri.parse(url), body: {"user_id": stringValue.toString()});

    Map<String, dynamic> jsonresponse = jsonDecode(response.body);
    bm = MyStuffyModel.fromJson(jsonresponse);
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
            size: 25,
            color: Colors.black,
          ),
          elevation: 1,
          backgroundColor: colors.whit,
          title: Text(
            "My Stuffy",
            style: const TextStyle(
                fontSize: 18,
                fontFamily: 'Aboshi',
                fontWeight: FontWeight.w400,
                color: colors.black1,
                height: 2),
          ),
          centerTitle: true,
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (result) {
                if (result == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GetallFrindScreen()),
                  );
                }
                if (result == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyGalleryScreen()),
                  );
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 0,
                  child: Text("Add Friend"),
                ),
                PopupMenuItem(
                  value: 1,
                  child: Text("My Gallery"),
                ),
              ],
            ),
          ]
          ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20, right: 10),
        child: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: colors.primary,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => AddStuffyScreen()));
            }),
      ),
      body: FutureBuilder(
        future: fechData(),
        builder: (context, AsyncSnapshot<MyStuffyModel> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.data.length == 0) {
              return Center(
                child: Text("No Data Found"),
              );
            } else {
              return GridView.builder(
                  itemCount: snapshot.data!.data.length,
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
                        print("kfjklgjhgjkshfvthgfndsfkggh");
                   print("${snapshot.data!.data[index].status.name}");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyProductDeatailsScreen(
                                      imangNAME:
                                          "${snapshot.data!.data[index].qrCodeImage}",
                                      productId:
                                          "${snapshot.data!.data[index].id}",
                                      satus:
                                          "${snapshot.data!.data[index].status.name}",
                                      x: snapshot.data!.data[index].images,
                                      name:
                                          "${snapshot.data!.data[index].productName}",
                                      Description:
                                          "${snapshot.data!.data[index].description}",
                                      images: snapshot.data!.data[index]
                                          .images[0].imageNames
                                          .toString(),
                                    )
                            ));
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
                                      image: NetworkImage(
                                        snapshot.data!.data[index].images[0]
                                            .imageNames
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
                              snapshot.data!.data[index].productName.toString(),
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Aboshi',
                                  overflow: TextOverflow.ellipsis)),
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text(
                              snapshot.data!.data[index].productName,
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
            }
          } else {
            return Center(
              child: CircularProgressIndicator(color: colors.primary),
            );
          }
        },
      ),
    );
  }
}
