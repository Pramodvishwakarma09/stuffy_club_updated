//
// import 'dart:convert';
//
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:ndialog/ndialog.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'AS.dart';
// import 'package:http/http.dart'as http;
// import 'home_screen.dart';
// import '../Termes/privacy_Policy.dart';
// import '../common function/basurl.dart';
// import '../model/grid_view_model/grid_view_model.dart';
//
// List<String> titles = [
//   "Panda",
//   "20Styx",
//   "Inroom",
//   "Panda",
//   "20Styx",
//   "Inroom",
//   "Panda",
//   "20Styx",
//   "Inroom",
//   "Panda",
//   "20Styx",
//   "Inroom",
// ];
// final subtitles = [
//   "SCA-05",
//   "SCA-15",
//   "SCA-11",
//   "SCA-05",
//   "SCA-15",
//   "SCA-11",
//   "SCA-05",
//   "SCA-15",
//   "SCA-11",
//   "SCA-05",
//   "SCA-15",
//   "SCA-11",
// ];
//
// List<String> images = [
//   "asset/images/Blue TD.png",
//   "asset/images/Blue TD.png",
//   "asset/images/Blue TD.png",
//   "asset/images/E1.png",
//   "asset/images/unsplash_4wYxcWA5MbI123.png",
//   "asset/images/E1.png",
//   "asset/images/unsplash_4wYxcWA5MbI123.png",
//   "asset/images/E1.png",
//   "asset/images/unsplash_4wYxcWA5MbI123.png",
//   "asset/images/E1.png",
//   "asset/images/unsplash_4wYxcWA5MbI123.png",
//   "asset/images/E1.png",
// ];
//
// class My_Stuff extends StatefulWidget {
//   const My_Stuff( {Key? key}) : super(key: key);
//   @override
//
//   State<My_Stuff> createState() => _My_StuffState();
// }
//
// class _My_StuffState extends State<My_Stuff> {
//
//   int pageIndex = 0;
//    List<Grid_view> pages = [
//     Grid_view(),
//     Grid_view(),
//   ];
//   String _scanBarcode = 'Unknown';
//   Future<void> startBarcodeScanStream() async {
//     FlutterBarcodeScanner.getBarcodeStreamReceiver(
//         '#FFFFFF', 'Cancel', true, ScanMode.BARCODE)!
//         .listen((barcode) => print(barcode));
//   }
//   Future<void> scanQR() async {
//     String barcodeScanRes;
//     try {
//       barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//           '#FFFFFF', 'Cancel', true, ScanMode.QR);
//       print(barcodeScanRes);
//     } on PlatformException {
//       barcodeScanRes = 'Failed to get platform version.';
//     }
//     if (!mounted) return;
//     setState(() {
//       _scanBarcode = barcodeScanRes;
//     });
//   }
//   Future<void> scanBarcodeNormal() async {
//     String barcodeScanRes;
//     try {
//       barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//           '#FFFFFF', 'Cancel', true, ScanMode.BARCODE);
//       print(barcodeScanRes);
//     } on PlatformException {
//       barcodeScanRes = 'Failed to get platform version.';
//     }
//
//     if (!mounted) return;
//     setState(() {
//       _scanBarcode = barcodeScanRes;
//     });
//   }
//
//
//   ProgressDialog? progressDialog;
//   var success, message, data;
//   var alldata;
//   var tokanget, username;
//   var user_id;
//   Future? _future;
//
//   List<Data>? Data1 = [];
//
// /*
//   Future<Grid_view_model> Grid_view_data() async {
//
//     print('????????????????????111111111111111');
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     tokanget = prefs.getString('login_tokan');
//     tokanget = tokanget!.replaceAll('"', '');
//     user_id = prefs.getString('user_id');
//     user_id = user_id!.replaceAll('"', '');
//     print('????????');
//
//     check().then((intenet) {
//       if (intenet != null && intenet) {
//         progressDialog = ProgressDialog(context, dismissable: false);
//         progressDialog?.setMessage(Text("Loading...."));
//         //   progressDialog?.show();
//
//       }
//       else {
//         Fluttertoast.showToast(
//             msg: "Please check your Internet connection!!!!",
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.BOTTOM,
//             backgroundColor: HexColor('#ED1D22'),
//             textColor: Colors.white,
//             fontSize: 16.0);
//       }
//     }
//     );
//
//     Map toMap() {
//       var map =  Map<String, dynamic>();
//       map["user_id"] = user_id;
//       return map;
//     }
//     print(toMap().toString());
//     print(beasurl1 + "getProductsbyuserid");
//     var response = await http.get(Uri.parse(beasurl1 + "getProductsbyuserid"),
//
//         headers: {
//           'Authorization': 'Bearer $tokanget',
//         }
//         );
//
//     progressDialog!.dismiss();
//
//     // var a = json.decode(response.body);
//     // var b = a['message'];
//     // if (b != 'Home page Details') {
//     //   Navigator.pop(context);
//     // }
//
//     print('>>>>>>>>>>>>>>>>>');
//
//     print('Grid_view response${Grid_view_model.fromJson(json.decode(response.body)).data}');
//
//    // print(response.body);
//     success = (Grid_view_model.fromJson(json.decode(response.body)).success);
//     message = (Grid_view_model.fromJson(json.decode(response.body)).message);
//     Data1 =   (Grid_view_model.fromJson(json.decode(response.body)).data);
//
//     print('Grid_view response${(Grid_view_model.fromJson(json.decode(response.body)))}');
//
//     progressDialog!.dismiss();
//     if (success == true) {
//       progressDialog!.dismiss();
//
//       // Categories1 = (Grid_view_model.fromJson(json.decode(response.body)).categories)!;
//       // print(Categories1!.length);
//     }
//     else {
//       progressDialog!.dismiss();
//
//       print('data Not Found=====');
//
//       Fluttertoast.showToast(
//           msg: message,
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           backgroundColor: HexColor('#000000'),
//           textColor: Colors.white,
//           fontSize: 16.0);
//     }
//     return Grid_view_model.fromJson(json.decode(response.body));
//   }
//
//   Future<bool> check() async {
//     var connectivityResult = await (Connectivity().checkConnectivity());
//     if (connectivityResult == ConnectivityResult.mobile) {
//       return true;
//     } else if (connectivityResult == ConnectivityResult.wifi) {
//       return true;
//     }
//     return false;
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _future = Grid_view_data();
//   }*/
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//         appBar: AppBar(
//         centerTitle: true,
//         elevation:0.5,
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//               title: Text('My Stuffy',style: TextStyle(fontSize:18,
//             fontFamily: 'Aboshi', fontWeight: FontWeight.w400,color: HexColor('#000000'),
//               height:2),),
//
//           leading: IconButton(icon: Icon(Icons.arrow_back_ios,
//           color: HexColor('#000000'),),
//            onPressed: (){
//             // Navigator.pop(context);
//             },
//             ),
//           actions: [
//              InkWell(
//                   onTap: (){
//                     // Navigator.push(context, MaterialPageRoute(
//                     //     builder: (_)=> POPUPMENU())
//                     // );
//                   },
//                child: SvgPicture.asset('asset/new icons/Shape1.svg'),
//              ),
//                 PopupMenuButton(
//                 itemBuilder: (context){
//                   return [
//                     const PopupMenuItem<int>(
//                         value: 0,
//                         child: Text("Privacy Policy ",style: TextStyle(
//                           fontSize: 16,fontWeight: FontWeight.w400,fontFamily: 'Aboshi',
//                         )
//                         )
//                     ),
//
//                     const PopupMenuItem<int>(
//                         value: 1,
//                         child: Text(" Terms & Condition",style: TextStyle(
//                           fontSize: 16,fontWeight: FontWeight.w400,fontFamily: 'Aboshi',
//                         )
//                         )
//                     ),
//
//                   ];
//                 },
//                 onSelected:(value){
//                   if(value == 0){
//                     Navigator.push(context, MaterialPageRoute(
//                         builder: (_)=> Condition())
//                     );
//                   }else
//                   if(value == 1){
//                     // Navigator.push(context, MaterialPageRoute(
//                     //     builder: (_)=> terms_condition())
//                     );
//                   }
//                 }
//             ),
//         ]
//         ),
//
//       body:pages[pageIndex],
//       floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
//       floatingActionButton: Padding(padding: const EdgeInsets.only(bottom:65,right:18),
//         child: FloatingActionButton(
//           child: Icon(Icons.add),
//           backgroundColor: HexColor('#03A9D6'),
//           onPressed:(){ Navigator.push(context, MaterialPageRoute(
//             builder: (_)=>AS1())
//              );
//            }
//           ),
//       ),
//     );
//   }
//
//   Container buildMyNavBar(BuildContext context) {
//     return Container(
//       height:100,
//       decoration: BoxDecoration(
//         color: Theme.of(context).primaryColor,
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(300),
//           topRight: Radius.circular(300),
//         ),
//       ),
//     );
//   }
// }
//
//
// class Grid_view extends StatefulWidget {
//   List<Data>? Data1 = [];
//
//    Grid_view({Key? key, this.Data1 }) : super(key: key);
//
//   get deviceHeight => null;
//   get deviceWidth => null;
//
//   @override
//   State<Grid_view> createState() => _Grid_viewState();
// }
//
// class _Grid_viewState extends State<Grid_view> {
//   ProgressDialog? progressDialog;
//   var success, message, data;
//   var alldata;
//   var tokanget, username;
//   var user_id;
//   Future? _future;
//
//   List<Data>? Data1 = [];
//
//
//   Future<Grid_view_model> Grid_view_data() async {
//
//     print('????????????????????111111111111111');
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     tokanget = prefs.getString('login_tokan');
//     tokanget = tokanget!.replaceAll('"', '');
//     user_id = prefs.getString('user_id');
//     user_id = user_id!.replaceAll('"', '');
//     print('????????');
//
//     check().then((intenet) {
//       if (intenet != null && intenet) {
//         progressDialog = ProgressDialog(context, dismissable: false);
//         progressDialog?.setMessage(Text("Loading...."));
//         //   progressDialog?.show();
//
//       }
//       else {
//         Fluttertoast.showToast(
//             msg: "Please check your Internet connection!!!!",
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.BOTTOM,
//             backgroundColor: HexColor('#ED1D22'),
//             textColor: Colors.white,
//             fontSize: 16.0);
//       }
//     }
//     );
//
//     Map toMap() {
//       var map =  Map<String, dynamic>();
//       map["user_id"] = user_id;
//       return map;
//     }
//     print(toMap().toString());
//     print(beasurl1 + "getProductsbyuserid");
//
//     var response = await http.post(Uri.parse(beasurl1 + "getProductsbyuserid"),body:toMap(),
//         headers: {
//           'Authorization': 'Bearer $tokanget',
//         }
//     );
//
//     progressDialog!.dismiss();
//
//     // var a = json.decode(response.body);
//     // var b = a['message'];
//     // if (b != 'Home page Details') {
//     //   Navigator.pop(context);
//     // }
//
//     print('>>>>>>>>>>>>>>>>>');
//
//     print('Grid_view response${Grid_view_model.fromJson(json.decode(response.body)).data}');
//
//     // print(response.body);
//     success = (Grid_view_model.fromJson(json.decode(response.body)).success);
//     message = (Grid_view_model.fromJson(json.decode(response.body)).message);
//     Data1 =   (Grid_view_model.fromJson(json.decode(response.body)).data);
//
//     print('Grid_view response${(Grid_view_model.fromJson(json.decode(response.body)))}');
//
//     progressDialog!.dismiss();
//     if (success == true) {
//       progressDialog!.dismiss();
//
//       // Categories1 = (Grid_view_model.fromJson(json.decode(response.body)).categories)!;
//       // print(Categories1!.length);
//     }
//     else {
//       progressDialog!.dismiss();
//
//       print('data Not Found=====');
//
//       Fluttertoast.showToast(
//           msg: message,
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           backgroundColor: HexColor('#000000'),
//           textColor: Colors.white,
//           fontSize: 16.0);
//     }
//     return Grid_view_model.fromJson(json.decode(response.body));
//   }
//
//   Future<bool> check() async {
//     var connectivityResult = await (Connectivity().checkConnectivity());
//     if (connectivityResult == ConnectivityResult.mobile) {
//       return true;
//     } else if (connectivityResult == ConnectivityResult.wifi) {
//       return true;
//     }
//     return false;
//   }
//
//   var imageusr = "http://192.168.1.23:4000/product/";
//
//   @override
//   void initState() {
//     super.initState();
//     _future = Grid_view_data();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return   FutureBuilder(
//       future: _future,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return GridView.builder(
//               itemCount:Data1!.length,
//               padding: const EdgeInsets.only(top: 29),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   childAspectRatio: 5 / 6,
//                   mainAxisExtent: 120,
//                   crossAxisCount: (Orientation.portrait == MediaQuery.of(context).orientation)
//                       ? 3 : 0),
//               itemBuilder: (context, index) {
//                 return Padding(padding: const EdgeInsets.all(2.0),
//                   child: Column(
//                       children: [
//                         Container(
//                           width: 709,
//                           height: 70,
//                           child: Stack(
//                             children: [
//                               Container(
//                                 width: 700,
//                                 height: 70,
//                                 decoration: BoxDecoration(
//                                   //  borderRadius: BorderRadius.circular(15),
//                                   shape: BoxShape.circle,
//                                   border: Border.all(
//                                       color: HexColor('#03A9D6')
//                                   ),
//                                   image: DecorationImage(
//                                     // fit: BoxFit.cover,
//                                     scale: 0.5,
//                                     image: NetworkImage(imageusr+Data1![index].images![0].imageNames.toString(),
//                                   ),
//                                   ),
//                                 ),
//                                 alignment: Alignment.center,
//                               ),
//                               Container(
//                                 width: 700,
//                                 height: 70,
//                                 alignment: Alignment.center,
//                                 // margin: const EdgeInsets.only(right:20,left: 20),
//                                 child: DottedBorder(
//                                     borderType: BorderType.Circle,
//                                     radius: const Radius.circular(79),
//                                     dashPattern: const [12, 5],
//                                     color: (index % 3 == 0)
//                                         ? HexColor('#03A9D6')
//                                         :
//                                     ((index % 3 == 1)
//                                         ? Colors.redAccent
//                                         : Colors
//                                         .green),
//                                     strokeWidth: 2,
//                                     child: Container(
//                                       width: 709,
//                                       height: 70,
//                                     )
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//
//                         Text(Data1![index].productName.toString(),
//                             maxLines: 1,
//                             style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w500,
//                           fontFamily: 'Aboshi',overflow: TextOverflow.ellipsis
//                         )
//                         ),
//
//                   Padding(
//                       padding: const EdgeInsets.only(top: 2),
//                     child: Text(Data1![index].description.toString(),
//                           maxLines: 1,
//                           style: TextStyle(color: HexColor('#03A9D6'),
//                             fontSize: 10,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'Poppins',overflow: TextOverflow.ellipsis
//                           ),),
//                   )
//                       ]
//                   ),
//                 );
//               }
//           );
//         }
//         else {
//           return Center(child:
//           const CircularProgressIndicator());
//         }
//       },
//       // future: postlist(),
//     );
//
//
//   }
// }
//
//
//
//
//
//
// /*
//
//
// class page1 extends StatelessWidget {
//   const page1({Key? key}) : super(key: key);
// //  Future? _future;
//   get deviceHeight => null;
//   get deviceWidth => null;
//
//   @override
//   void initState() {
//     super.initState();
//     _future = Grid_view_data();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _future,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return GridView.builder(
//               itemCount:4,
//               padding: EdgeInsets.only(top: 29),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   childAspectRatio: 5 / 6,
//                   mainAxisExtent: 120,
//                   crossAxisCount: (Orientation.portrait == MediaQuery
//                       .of(context)
//                       .orientation)
//                       ? 3 : 0),
//               itemBuilder: (context, index) {
//                 return Padding(padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                       children: [
//                         Container(
//                           width: 709,
//                           height: 70,
//                           child: Stack(
//                             children: [
//                               Container(
//                                 width: 700,
//                                 height: 70,
//                                 decoration: BoxDecoration(
//                                   //  borderRadius: BorderRadius.circular(15),
//                                   shape: BoxShape.circle,
//                                   border: Border.all(
//                                       color: HexColor('#03A9D6')),
//                                   image: DecorationImage(
//                                     // fit: BoxFit.cover,
//                                     scale: 0.5,
//                                     image: AssetImage(
//                                       images[index].toString(),),
//                                   ),
//                                 ),
//                                 alignment: Alignment.center,
//                               ),
//                               Container(
//                                 width: 700,
//                                 height: 70,
//                                 alignment: Alignment.center,
//                                 // margin: const EdgeInsets.only(right:20,left: 20),
//                                 child: DottedBorder(
//                                     borderType: BorderType.Circle,
//                                     radius: const Radius.circular(79),
//                                     dashPattern: const [12, 5],
//                                     color: (index % 3 == 0)
//                                         ? HexColor('#03A9D6')
//                                         :
//                                     ((index % 3 == 1)
//                                         ? Colors.redAccent
//                                         : Colors
//                                         .green),
//                                     strokeWidth: 2,
//                                     child: Container(
//                                       width: 709,
//                                       height: 70,
//                                     )
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//
//                         Text(titles[index], style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w500,
//                           fontFamily: 'Aboshi',
//                         )
//                         ),
//                         Text(subtitles[index],
//                           style: TextStyle(color: HexColor('#03A9D6'),
//                             fontSize: 10,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'Poppins',
//                           ),),
//                       ]
//                   ),
//                 );
//               }
//           );
//         } else {
//           return const CircularProgressIndicator();
//         }
//       },
//       // future: postlist(),
//     );
//
//
//       */
// /*
//       Container(
//         child: FutureBuilder(
//         future: _future,
//         builder: (context, snapshot)
//     {
//     return
//       GridView.builder(
//           itemCount:
//           //snapshot.data!.length,
//           titles.length,
//           padding: EdgeInsets.only(top: 29),
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               childAspectRatio: 5 / 6,
//               mainAxisExtent: 120,
//               crossAxisCount: (Orientation.portrait == MediaQuery
//                   .of(context)
//                   .orientation)
//                   ? 3 : 0),
//           itemBuilder: (context, index) {
//             return Padding(padding: const EdgeInsets.all(8.0),
//               child: Column(
//                   children: [
//                     Container(
//                       width: 709,
//                       height: 70,
//                       child: Stack(
//                         children: [
//                           Container(
//                             width: 700,
//                             height: 70,
//                             decoration: BoxDecoration(
//                               //  borderRadius: BorderRadius.circular(15),
//                               shape: BoxShape.circle,
//                               border: Border.all(color: HexColor('#03A9D6')),
//                               image: DecorationImage(
//                                 // fit: BoxFit.cover,
//                                 scale: 0.5,
//                                 image: AssetImage(images[index].toString(),),
//                               ),
//                             ),
//                             alignment: Alignment.center,
//                           ),
//                           Container(
//                             width: 700,
//                             height: 70,
//                             alignment: Alignment.center,
//                             // margin: const EdgeInsets.only(right:20,left: 20),
//                             child: DottedBorder(
//                                 borderType: BorderType.Circle,
//                                 radius: const Radius.circular(79),
//                                 dashPattern: const [12, 5],
//                                 color: (index % 3 == 0)
//                                     ? HexColor('#03A9D6')
//                                     :
//                                 ((index % 3 == 1) ? Colors.redAccent : Colors
//                                     .green),
//                                 strokeWidth: 2,
//                                 child: Container(
//                                   width: 709,
//                                   height: 70,
//                                 )
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//
//                     Text(titles[index], style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w500,
//                       fontFamily: 'Aboshi',
//                     )
//                     ),
//                     Text(subtitles[index],
//                       style: TextStyle(color: HexColor('#03A9D6'),
//                         fontSize: 10,
//                         fontWeight: FontWeight.w500,
//                         fontFamily: 'Poppins',
//                       ),),
//                   ]
//               ),
//             );
//           }
//       );
//   }
// }
//   // //   )
//   // //   );
//   // // }
//   // }*
//
//  */
//
