import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/my_sprites_model.dart';
import 'add_sprites_screen.dart';
import 'my_kitti_screen.dart';
import 'package:stuffy_club/helper/AppColor.dart';
import '../const.dart';

class My_Spirit extends StatefulWidget {
  const My_Spirit({Key? key}) : super(key: key);

  @override
  State<My_Spirit> createState() => _My_SpiritState();
}

class _My_SpiritState extends State<My_Spirit> {


  Future<GetSpritesModel> fechData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var stringValue = prefs.getInt('user_id');
    print("call fetch data");
    GetSpritesModel bm;
    String url = "${AppUrl.baseUrl}/getsprites";
    http.Response response = await http.post(Uri.parse(url),
        body:
        {"user_id": stringValue.toString()}
        // {"user_id": "18"}


    );
    Map<String, dynamic> jsonresponse = jsonDecode(response.body);
    print(jsonresponse.toString());
    bm = GetSpritesModel.fromJson(jsonresponse);
    print(jsonresponse.toString());
    return bm;

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(

          iconTheme: IconThemeData(
            color: Colors.black,
          ),
            centerTitle: true,
            elevation: 1,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Text('My Sprites', style: TextStyle(fontSize: 18,
                fontFamily: 'Aboshi',
                fontWeight: FontWeight.w400,
                color: HexColor('#000000'),
                height: 2),),

        ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20, right: 10),
        child: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: appcolor.primary,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => AddSpritesScreen()));
            }),
      ),


      body:  FutureBuilder(
            future: fechData(),
            builder: (context, AsyncSnapshot<GetSpritesModel> snapshot) {
              print("pramod");
              // print(snapshot.data!.response.length.toString());
              if (snapshot.hasData) {
                return  SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                      'Create Sprites',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Aboshi',
                        fontWeight: FontWeight.w400,
                        color: HexColor('#000000'),
                      ),),
                    ),
                      snapshot.data!.response.length==0 ?Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(.50),
                            borderRadius: BorderRadius.circular(15)
                          ),
                          height: 150,
                          child: Center(child: Text("No My Sprites Stuffys Found"),),
                        ),
                      ) :   Padding(
                        padding: const EdgeInsets.only(left: 15 ,right: 15),
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.response.length,
                            itemBuilder: (BuildContext ctx, int index) {
                              return InkWell(
                                onTap: (){
                                  print("@@@@@@@@@@@@@@@@sfdgdhfgjghkghkghkfjfjfgjfgj");
                                  print(snapshot.data!.response[index]);
                                  //
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyKittiScreen(
                                      imageList: snapshot.data!.response[index].images
                                  ),));
                                },
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 15),
                                  child: Container(
                                    child: Center(child: Text(
                                      "${snapshot.data!.response[index].productName}",
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700,fontSize: 18),)),
                                    height: 150,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage("${snapshot.data!.response[index].images[0].imageNames}"),
                                        )
                                    ),
                                    //   child: Image.network(
                                    //       "${AppUrl.baseUrl}/product/${snapshot.data!.response[index].images[0].imageNames}" , height: 155, width: deviceWeight, fit: BoxFit.cover,  ),
                                    // ),
                                  ),
                                ),
                              );
                            }
                        ),
                      ),
                      Text(
                        'Add Stuffy By Gallery',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Aboshi',
                          fontWeight: FontWeight.w400,
                          color: HexColor('#000000'),
                        ),
                      ),
                      snapshot.data!.images.length==0 ?Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(child:Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(.50),
                              borderRadius: BorderRadius.circular(15)
                          ),
                          height: 150,
                          child: Center(child: Text("No My Sprites Images"),),
                        )),
                      )  :  Padding(
                        padding: const EdgeInsets.only(left: 15 ,right: 15),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(vertical: 15),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MyKittiScreen(
                                  imageList: snapshot.data!.images
                              ),));
                            },
                            child: Container(
                              child: Center(child: Text(
                                "My sprites",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700,fontSize: 18),)),
                              height: 150,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage("${snapshot.data!.images[0].imageNames}"),
                                  )
                              ),
                              //   child: Image.network(
                              //       "${AppUrl.baseUrl}/product/${snapshot.data!.response[index].images[0].imageNames}" , height: 155, width: deviceWeight, fit: BoxFit.cover,  ),
                              // ),
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                );
              } {

                return Center(
                  child:CircularProgressIndicator(),
                );
              }
            }),

    );
  }
}


