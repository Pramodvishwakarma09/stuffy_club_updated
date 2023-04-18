import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:stuffy_club/Screens/add_stuffy_screen.dart';
import '../models/seeall_model.dart';

class ProductDeatailsScreen extends StatefulWidget {
  final String name;
  final String satus;
  final String Description;
  String images;
  List x;
  String? imangNAME;
  // List x;
  ProductDeatailsScreen({
    Key? key,
    this.imangNAME,
    required this.satus,
    required this.x,
    required this.name,
    // required this.satus,
    required this.Description,
    // // required this.x,
    required this.images,
    //
  }) : super(key: key);

  @override
  State<ProductDeatailsScreen> createState() => _ProductDeatailsScreenState();
}

class _ProductDeatailsScreenState extends State<ProductDeatailsScreen> {
  var image = 0;
  var image_usr = 'http://192.168.1.23:4000/uploads/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawerEnableOpenDragGesture: false,
        appBar: AppBar(
          centerTitle: true,
          elevation: 1,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            "${widget.name}",
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'Aboshi',
                fontWeight: FontWeight.w400,
                color: HexColor('#000000'),
                height: 2),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: HexColor('#000000'),
            ),
            onPressed: () {
              {
                Navigator.pop(context);
              }
            },
          ),
          actions: [
            Container(

              child: PopupMenuButton(
                icon: Image.asset('asset/7066144.png'),
                  itemBuilder: (context) {

                return [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Container(
                        width: 300,
                        height: 300,
                        child: Image(
                          width: 70,
                          image: NetworkImage(
                            "${widget.imangNAME}",
                          ),
                          fit: BoxFit.fill,
                        )),
                  ),
                ];
              }, onSelected: (value) {
                if (value == 0) {
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (_) => Condition()));
                } else if (value == 1) {
                  print("Settings menu is selected.");
                }
              }),
            ),
          ],
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
                            color: HexColor('#000000'),
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
                            color: HexColor('#ED1D22'),
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
                  color: HexColor('#000000'),
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
                  color: HexColor('#000000'),
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
                          "http://192.168.1.23:4000/product/${widget.x[image].imageNames}",
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
                                        : HexColor('#FFFFFF'),
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
                                                "http://192.168.1.23:4000/product/${widget.x[index].imageNames}",
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => AddStuffyScreen()));
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
                    'Create Stripe',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Aboshi',
                        color: HexColor('#FFFFFF')),
                  ),
                ),
              ),
            ),
          ],
        )));
  }
}
