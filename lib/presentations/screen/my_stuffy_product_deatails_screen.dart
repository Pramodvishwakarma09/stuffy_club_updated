import 'dart:convert';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stuffy_club/presentations/screen/qr_screen_page.dart';
import '../../../utils/constants/colors.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../test.dart';
import '../../utils/constants/appurls.dart';
import 'package:hexcolor/hexcolor.dart';
import 'edit_sprites_screen.dart';
import 'my_stuffy_screen.dart';

class MyProductDeatailsScreen extends StatefulWidget {
  final String  productId;
  final String name;
  final String satus;
  final String Description;
  String images;
  List x;
  String? imangNAME;
  MyProductDeatailsScreen({
    Key? key,
    this.imangNAME,
    required this.satus,
    required this.x,
    required this.name,
    required this.Description,
    required this.images,
     required this.productId,
    //
  }) : super(key: key);

  @override
  State<MyProductDeatailsScreen> createState() => _MyProductDeatailsScreenState();
}

class _MyProductDeatailsScreenState extends State<MyProductDeatailsScreen> {


  var image = 0;
  bool loading = false;
  void addStripe() async {
    loading = true;

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var stringValue = prefs.getInt('user_id');
      final response = await http.post(
        Uri.parse(AppUrl.addsprite),
        body: {
          "user_id":stringValue.toString(),
          "product_id":"${widget.productId}",
        },
      ).timeout(Duration(seconds: 30));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var login = data['message'];
        Fluttertoast.showToast(
          msg: "${data["message"]}",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: colors.primary,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        setState(() {
          loading = false;
        });

      } else {
        setState(() {
          // Fluttertoast.showToast(
          //   msg: "${data["message"]}",
          //   toastLength: Toast.LENGTH_LONG,
          //   //duration
          //   gravity: ToastGravity.TOP,
          //   //location
          //   timeInSecForIosWeb: 1,
          //   backgroundColor: Colors.red,
          //   //background color
          //   textColor: Colors.white,
          //   //text Color
          //   fontSize: 16.0,
          //   //font size
          // );

          loading = false;
        });
      }
    } catch (e) {
      setState(() {loading = false;});
      Fluttertoast.showToast(
        msg: "${e.toString()}",
        toastLength: Toast.LENGTH_LONG,
        //duration
        gravity: ToastGravity.TOP,
        //location
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        //background color
        textColor: Colors.white,
        //text Color
        fontSize: 16.0,
        //font size
      );
      print(e.toString());
    }
  }
  void deleteProfile( ) async {
    print("gggsggggpramfggggggggggggrerehfrjthfdb");
    loading = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var stringValue = prefs.getInt('user_id');
    try {
      final response = await http.post(
        Uri.parse(AppUrl.delete_product),
        body: {
          "user_id": "${stringValue}",
          "product_id" : widget.productId.toString()
        },
      ).timeout(Duration(seconds: 30));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        // bool login = data['success'];

        // Fluttertoast.showToast(
        //   msg: "${data["message"]}",
        //   toastLength: Toast.LENGTH_LONG,
        //   //duration
        //   gravity: ToastGravity.BOTTOM,
        //   //location
        //   timeInSecForIosWeb: 1,
        //   backgroundColor: Colors.red,
        //   //background color
        //   textColor: Colors.white,
        //   //text Color
        //   fontSize: 16.0,
        //   //font size
        // );
        setState(() {
          loading = false;
        });
      } else {
        setState(() {
          loading = false;
        });
      }
    } catch (e) {
      setState(() {loading = false;});
      Fluttertoast.showToast(
        msg: "${e.toString()}",
        toastLength: Toast.LENGTH_LONG,
        //duration
        gravity: ToastGravity.TOP,
        //location
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        //background color
        textColor: Colors.white,
        //text Color
        fontSize: 16.0,
        //font size
      );
      print(e.toString());
    }
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
        drawerEnableOpenDragGesture: false,
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: colors.black1
          ),
          centerTitle: true,
          elevation: 1,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            "Stuffy",
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
              {
                Navigator.pop(context);
              }
            },
          ),
          // actions: [
          //   PopupMenuButton(
          //     itemBuilder: (context) {
          //       return [
          //         PopupMenuItem<int>(
          //           value: 0,
          //           child: Container(
          //               width: 300,
          //               height: 300,
          //               child: Image(
          //                 width: 70,
          //                 image: NetworkImage(
          //                   "${widget.imangNAME}",
          //                 ),
          //                 fit: BoxFit.fill,
          //               )),
          //         ),
          //       ];
          //     },
          //   ),
          // ],
            actions: <Widget>[
              PopupMenuButton(
                onSelected: (result) {
                  if (result == 0) {
                    print("@@@@@@@@@@@@@@@@@@@@@@@pramod");
                    print(widget.productId);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditSpritesScreen(
                        imangNAME:widget.imangNAME.toString(),
                        productId:widget.productId,
                        satus:widget.satus,
                        x: widget.x,
                        name: widget.name,
                        Description: widget.Description,
                        images: widget.images,
                      )
                      ),
                    );
                  }
                  if (result == 1) {
                    setState(() {
                      deleteProfile();
                      print(widget.productId);

                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyStuffyScreen(),));
                      // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                      //     LoginScreen()), (Route<dynamic> route) => false);
                    });
                  }
                  if (result == 2) {


                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QrCodeScren(imagename: widget.imangNAME,)),
                    );
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 0,
                    child: Text("Edit"),
                  ),
                  PopupMenuItem(
                    value: 1,
                    child: Text("Delete"),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text("Qr"),
                  ),
                ],
              ),
            ]
        ),
        body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    children: [
                      DottedBorder(
                          padding: EdgeInsets.only(
                            right: 6,
                            bottom: 1,
                          ),
                          borderType: BorderType.Circle,
                          radius: Radius.circular(20),
                          dashPattern: [10, 5],
                          color: HexColor('#03A9D6'),
                          strokeWidth: 2,
                          child: Container(
                            height: 98,
                            width: 98,
                            padding: EdgeInsets.only(left: 6, top: 3, bottom: 1),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              //  child:Image.network(image_usr+widget.Data1![index].productImage.toString())
                              child: Image(
                                height: 50,
                                width: 50,
                                image: NetworkImage("${widget.images}"),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          )),
                      // )
                      Column(
                        children: [
                          const SizedBox(height: 3),
                          Container(
                            padding: EdgeInsets.only(left: 22, top: 3),
                            alignment: Alignment.topCenter, //PN
                            child: Text(
                              '${widget.name}',
                              //(widget.Data1![index].productName.toString()),
                              style: TextStyle(
                                fontSize: 24,
                                fontFamily: 'Aboshi',
                                fontWeight: FontWeight.w400,
                                color: colors.black1,
                              ),
                            ),
                          ),
                          SizedBox(height: 1),
                          Container(
                            padding: EdgeInsets.only(left: 12, top: 7),
                            alignment: Alignment.topCenter, //DESCRIPTION
                            child: Text(
                              '${widget.name}',
                              // (StuffProductdetails!.first.description.toString()),
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                color: HexColor('#7D7D7D'),
                              ),
                            ),
                          ),
                          const SizedBox(height: 1),
                          Container(
                            padding: EdgeInsets.only(left: 12, top: 8),
                            alignment: Alignment.topCenter, //STATUS
                            child: Text(
                              "${widget.satus}",
                              //(widget.Data1![index].status.toString()),
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                color:colors.red,
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                        ],
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Divider(
                    color: HexColor('#C7C7C7'),
                    //color of divider
                    thickness: 1,
                    //thickness of divier line
                    height: 20,
                    indent: 1,
                    // Spacing at the top of divider.
                    endIndent: 1, //Spacing at the bottom of divider.
                  ),
                ),
                SizedBox(height: 1),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 126),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Stuffy Story',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Aboshi ',
                      fontWeight: FontWeight.w400,
                      color: colors.black1,
                    ),
                  ),
                  // padding: EdgeInsets.only(left:20,top:1,),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.only(
                    left: 20,
                    top: 1,
                  ),
                  child: Text(
                    widget.Description,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: HexColor('#ACACAC'),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Divider(
                  color: HexColor('#C7C7C7'),
                  thickness: 1,
                  indent: 1,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    ' Stuffy Images',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Aboshi',
                      fontWeight: FontWeight.w400,
                      color: colors.black1,
                    ),
                  ),
                  padding: EdgeInsets.only(left: 20, top: 15, right: 25),
                ),
//////////////////////////////////////////////////////////////////container
                SizedBox(height: 20, width: 335),
                Column(children: [
                  Container(
                    height: 229,
                    width: 335,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(children: [
                        Container(
                          height: 229,
                          width: 335,
                          child: Image(
                            image: NetworkImage(
                              "${widget.x[image].imageNames}",
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                            height: 20,
                            width: 200,
                            child: ListView.builder(
                                itemCount: widget.x.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration:
                                      BoxDecoration(shape: BoxShape.rectangle),
                                      child: Container(
                                        color: (image == index)
                                            ? HexColor('#86C33C')
                                            : colors.whit,
                                        width: 32,
                                        height: 4,
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Stack(children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        height: 104,
                        child: ListView.builder(
                            itemCount: widget.x.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        image = index;
                                      });
                                    },
                                    child: Container(
                                      width: 80,
                                      height: 104,
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(20),
                                            child: Container(
                                                width: 100,
                                                height: 100,
                                                child: Image(
                                                  width: 70,
                                                  image: NetworkImage(
                                                    "${widget.x[index].imageNames}",
                                                  ),
                                                  fit: BoxFit.fill,
                                                )),
                                          ),
                                          (image == index)
                                              ? Container(
                                            width: 100,
                                            height: 100,
                                            child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    image = index;
                                                  });
                                                },
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.all(
                                                      28.0),
                                                  child: SvgPicture.asset(
                                                      'asset/new icons/eye.svg'),
                                                )),
                                          )
                                              : Container()
                                        ],
                                      ),
                                    ),
                                  ));
                            }),
                      ),
                    ]),
                  ),
                ]),

                //StuffProductdetails:StuffProductdetails),
                SizedBox(height: 27),
                InkWell(
                  onTap: () {
                    addStripe();
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (_) => AddStuffyScreen()));
                  },
                  child: Container(
                    margin: EdgeInsets.all(12),
                    padding: EdgeInsets.only(right: 32, left: 32),
                    decoration: BoxDecoration(
                        color: HexColor('#03A9D6'),
                        borderRadius: BorderRadius.circular(13)),
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: Center(
                      child: Text(
                        'Create Sprites',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Aboshi',
                            color: colors.whit),
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
