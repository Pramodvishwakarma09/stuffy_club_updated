import 'dart:convert';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'product_deatails.dart';
import '../models/product_by_category_model.dart';
import '../const.dart';

class ProductByCategoryScreen extends StatefulWidget {
  final String cname;
  final int category_id;
  const ProductByCategoryScreen({Key? key ,required this.category_id, required this.cname}) : super(key: key);

  @override
  State<ProductByCategoryScreen> createState() => _ProductByCategoryState();
}

class _ProductByCategoryState extends State<ProductByCategoryScreen> {


  Map? data;
  Future<ProductByCategoryModel> fechData() async {
    ProductByCategoryModel bm;
    String url = "${AppUrl.baseUrl}/getProductbycategory";
    http.Response response = await http.post(Uri.parse(url),
      body: {
        'category_id': "${widget.category_id}"
      }

    );
    Map<String, dynamic> jsonresponse = jsonDecode(response.body);
    bm = ProductByCategoryModel.fromJson(jsonresponse);
    return bm;
    // setState(() {
    //   data= jsonresponse["time"];
    //
    // });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation:0.5,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text('${widget.cname}',style: TextStyle(fontSize:18,
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
            builder: (context, AsyncSnapshot<ProductByCategoryModel> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if(snapshot.data!.data.length==0){
                  return Center(child: Text("No Data Found"),);
                }else{
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Expanded(
                          child:GridView.builder(
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
                                  onTap: (){
                                    print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@qrCodeImage");
                                    print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@qrCodeImage${snapshot.data!.data[index].qrCodeImage}");
                                    Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                        ProductDeatailsScreen(
                                          productId: "${snapshot.data!.data[index].id}",
                                          imangNAME: snapshot.data!.data[index].qrCodeImage,
                                          name: "${snapshot.data!.data[index].productName}",
                                          Description: "${snapshot.data!.data[index].description}",
                                          satus: "${snapshot.data!.data[index].status.name}",
                                          images:"${snapshot.data!.data[index].images[0].imageNames.toString()}",
                                          x:  snapshot.data!.data[index].images ,
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
                                                  image: NetworkImage(snapshot.data!.data[index].images[0]
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
                                      Text(snapshot.data!.data[index].productName.toString(),
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