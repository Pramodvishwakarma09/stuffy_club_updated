import 'dart:convert';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'product_deatails.dart';
import '../const.dart';

import '../models/seeall_model.dart';

class SeeAllScreen extends StatefulWidget {
  const SeeAllScreen({Key? key}) : super(key: key);

  @override
  State<SeeAllScreen> createState() => _SeeAllScreenState();
}

class _SeeAllScreenState extends State<SeeAllScreen> {


  Future<SeealllModel> fechData() async {
    SeealllModel bm;
    String url = "${AppUrl.baseUrl}/getexclusive_stuffy";
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> jsonresponse = jsonDecode(response.body);
    bm = SeealllModel.fromJson(jsonresponse);
    return bm;

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          centerTitle: true,
          elevation:0.5,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text('Exclusive Stuffy',style: TextStyle(fontSize:18,
              fontFamily: 'Aboshi', fontWeight: FontWeight.w400,color: HexColor('#000000'),
              height:2),),

          leading: IconButton(icon: Icon(Icons.arrow_back_ios,
            color: HexColor('#000000'),),
            onPressed: (){
             Navigator.pop(context);
            },
          ),

      ),
      body: SafeArea(
        child: FutureBuilder(
            future: fechData(),
            builder: (context, AsyncSnapshot<SeealllModel> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if(snapshot.data!.response.length==0){
                  return Center(child: Text("Data is Not available"));
                }else{
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child:GridView.builder(
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
                                    print("QQQQQQQQQQQQQQQQQQQQQQQQQQQ${snapshot.data!.response[index].productName}",);
                                    print("2pramoddffsdfsdfsdfsffsfsf____________${snapshot.data!.response[index].id}",);
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDeatailsScreen(
                                      productId: "${snapshot.data!.response[index].id}",
                                      imangNAME:"${snapshot.data!.response[index].qrCodeImage}",
                                      name: "${snapshot.data!.response[index].productName}",
                                      Description: "${snapshot.data!.response[index].description}",
                                      satus: "${snapshot.data!.response[index].status}",
                                      images:"${snapshot.data!.response[index].images[0].imageNames.toString()}",
                                      x:  snapshot.data!.response[index].images ,
                                    ),));
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
                                                  image: NetworkImage(snapshot.data!.response[index].images[0]
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
                                      )
                                    ]),
                                  ),
                                );
                              })
                      )


                    ],
                  );
                }

              }
            }),
      ),
    );
  }
}