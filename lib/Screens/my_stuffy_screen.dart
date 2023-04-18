import 'dart:convert';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'product_deatails.dart';
import 't_c_screen.dart';
import '../models/pramod_model.dart';
import 'add_stuffy_screen.dart';

class MyStuffyScreen extends StatefulWidget {
  const MyStuffyScreen({Key? key}) : super(key: key);

  @override
  State<MyStuffyScreen> createState() => _StuffyScreenState();
}

class _StuffyScreenState extends State<MyStuffyScreen> {
  Map? data;
  Future<PramodModel> fechData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var stringValue = prefs.getInt('user_id');
    PramodModel bm;
    String url = "http://192.168.1.23:4000/getgallery";
    http.Response response = await http.post(Uri.parse(url),
        body: {"user_id": stringValue.toString()}
    );

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
          centerTitle: true,
          elevation:0.5,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text('My Stuffy',style: TextStyle(fontSize:18,
              fontFamily: 'Aboshi', fontWeight: FontWeight.w400,color: HexColor('#000000'),
              height:2),),

          actions: [
            InkWell(
              child: SvgPicture.asset('asset/new icons/Shape1.svg'),
            ),
            PopupMenuButton(
                itemBuilder: (context){
                  return [
                    const PopupMenuItem<int>(
                        value: 0,
                        child: Text("Privacy Policy ",style: TextStyle(
                          fontSize: 16,fontWeight: FontWeight.w400,fontFamily: 'Aboshi',
                        )
                        )
                    ),

                    const PopupMenuItem<int>(
                        value: 1,
                        child: Text(" Terms & Condition",style: TextStyle(
                          fontSize: 16,fontWeight: FontWeight.w400,fontFamily: 'Aboshi',
                        )
                        )
                    ),

                  ];
                },
                onSelected:(value){
                  if(value == 0){
                    // Navigator.push(context, MaterialPageRoute(
                    //     builder: (_)=> Condition())
                    // );
                  }else
                  if(value == 1){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (_)=> TCScreen())
                    );
                  }
                }
            ),
          ]
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(padding: const EdgeInsets.only(bottom:65,right:18),
        child: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: HexColor('#03A9D6'),
            onPressed:(){
              Navigator.push(context, MaterialPageRoute(
                builder: (_)=>AddStuffyScreen())
            );
            }
        ),
      ),
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
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (
                          context) => ProductDeatailsScreen(
                          satus: "${snapshot.data!.response[index].status}",
                          x: snapshot.data!.response[index].images,
                          name: "${snapshot.data!.response[index].productName}",
                          Description:  "${snapshot.data!.response[index].description}",
                          images:   "http://192.168.1.23:4000/product/" +
                              snapshot.data!.response[index].images[0]
                                  .imageNames
                                  .toString(),)));
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
                                  border: Border.all(color: HexColor('#03A9D6')),
                                  image: DecorationImage(
                                    // fit: BoxFit.cover,
                                    scale: 0.5,
                                    image: NetworkImage(
                                      "http://192.168.1.23:4000/product/" +
                                          snapshot.data!.response[index].images[0]
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
                        Text(snapshot.data!.response[index].productName.toString(),
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
              child: Container(
                child: Text("No Data Found"),
              ),
            );
          }
        },
      ),
    );
  }
}
