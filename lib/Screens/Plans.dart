// import'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:flutter_swiper_tv/flutter_swiper.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:stuffy_club/Screens/My_Stuff.dart';
// import 'package:stuffy_club/pagination/page1.dart';
// import 'package:stuffy_club/pagination/page2.dart';
// import 'Profile.dart';
// import '../Termes/privacy_Policy.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//
//
// class Plans extends StatefulWidget {
//   const Plans({Key? key}) : super(key: key);
//
//   @override
//   State<Plans> createState() => _PlansState();
// }
// class _PlansState extends State<Plans> {
//   //  get height => height;
//  List imageModel = ['1','2'];
//  int S = 0;
//
//
//  PageController controller = PageController();
//  int _curr = 0;
//  final List<Widget> _list = <Widget>[
//    Center(
//        child: Plan_Page1()),
//    Center(
//        child: Plan_Page2()),
//
//  ];
//  @override
//   Widget build(BuildContext context) {
//     final deviceHeight = MediaQuery.of(context).size.height/2;
//     final deviceWeight = MediaQuery.of(context).size.width/2;
//
//     return Scaffold(
//       backgroundColor: HexColor('#F5F5F5'),
//         appBar: AppBar(
//          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//            elevation: 1,
//               title: Text('Plans', style: TextStyle(
//            fontWeight: FontWeight.w400,
//           fontSize: 18,
//          fontFamily: 'Aboshi',
//          color: HexColor('#000000'))),
//           leading: IconButton(
//              onPressed: () {Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_ios ,
//     ),
//     color: HexColor('#000000'),
//     ),
//     actions:<Widget> [
//          InkWell(
//           onTap: (){
//            Navigator.push(context, MaterialPageRoute(
//               builder: (_)=> Condition())
//            );
//           },
//           child: SvgPicture.asset('asset/new icons/Shape1.svg'),
//            )
//          ,Padding(padding: EdgeInsets.only(left:35,right:2))
//
//     ],
//
//     centerTitle: true,
//     ),
//         body:  SingleChildScrollView(
//           child: Column(
//               children: [
//                 Container(
//                   height: MediaQuery.of(context).size.height*0.85,width:MediaQuery.of(context).size.width,
//                   child: PageView(
//                     allowImplicitScrolling: true,
//                     children: _list,
//                     scrollDirection: Axis.horizontal,
//                     controller: controller,
//                     onPageChanged: (num) {
//                       setState(() {
//                         _curr = num;
//                       });
//                     },
//                   ),
//                   //
//                   // Swiper(
//                   //  // control: _controller,
//                   //   itemCount: imageModel.length,
//                   //   // pagination: new SwiperPagination(),
//                   //   layout: SwiperLayout.DEFAULT,
//                   //   scrollDirection:Axis.horizontal,
//                   //   itemBuilder:(BuildContext context, int index) {
//                   //     var length=S;
//                   //     return index==0? Container(
//                   //       height: 510,width: MediaQuery.of(context).size.width,
//                   //       // color: Colors,
//                   //       child: Column(
//                   //         children: [
//                   //           Container(
//                   //             alignment: Alignment.topCenter,
//                   //             margin: EdgeInsets.only(left:12,top:42),
//                   //             child: Center(
//                   //               child: Text('Free Plan',style: TextStyle(
//                   //                   fontWeight: FontWeight.w400,
//                   //                   fontSize: 28,
//                   //                   fontFamily: 'Aboshi',
//                   //                   color: HexColor('#000000'))),
//                   //             ),
//                   //           ),
//                   //           SizedBox(height: 20),
//                   //           Card(
//                   //            // margin: EdgeInsets.symmetric(horizontal: 29, vertical: 7),
//                   //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
//                   //             color: HexColor('#03A9D6'),
//                   //             child: SizedBox(
//                   //               width: 319,
//                   //               child:  Container(
//                   //                 // padding: EdgeInsets.all(10),
//                   //                 decoration: BoxDecoration(
//                   //                   borderRadius: BorderRadius.circular(50),
//                   //                 ),
//                   //                 child: Column
//                   //                   (mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //                   crossAxisAlignment: CrossAxisAlignment.start,
//                   //                   children: [
//                   //                     Row(
//                   //                       children: [
//                   //                         Container(
//                   //                           alignment: Alignment.topCenter,
//                   //                           padding: EdgeInsets.only(left:90,top:1),
//                   //                           child: RichText(
//                   //                             textAlign: TextAlign.start,
//                   //                             text: TextSpan(
//                   //                                 text: '',
//                   //                                 style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                   //                                     fontWeight: FontWeight.w700,fontSize: 50),
//                   //
//                   //                                 children: <TextSpan>[
//                   //                                   TextSpan(
//                   //                                     text: '\$ ',
//                   //                                     style: TextStyle(color: HexColor('#FFFFFF'),
//                   //                                         fontFamily: 'Poppins',fontWeight: FontWeight.w600,
//                   //                                         fontSize: 18,wordSpacing:5),
//                   //                                   ),
//                   //                                   TextSpan(
//                   //                                     text: '0',
//                   //                                     style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                   //                                         fontWeight: FontWeight.w700,fontSize: 50),
//                   //                                   ),
//                   //                                   TextSpan(
//                   //                                     text: '/Month',
//                   //                                     style: TextStyle(color: HexColor('#FFFFFF'),
//                   //                                         fontFamily: 'Poppins',fontWeight: FontWeight.w600,
//                   //                                         fontSize: 18,wordSpacing:5),
//                   //                                   ),
//                   //
//                   //                                 ]
//                   //                             ),
//                   //                           ),
//                   //                         ),
//                   //
//                   //                       ],
//                   //                     ),
//                   //
//                   //                     Container(
//                   //                       // width: MediaQuery.of(context).size.width,
//                   //                       // height: MediaQuery.of(context).size.height * 0.70,
//                   //                       height: 1,
//                   //                       width:319 ,
//                   //                       color: HexColor('#FFFFFF'),
//                   //                     ),
//                   //                     SizedBox(height: 20),
//                   //                     Column(
//                   //                       mainAxisAlignment: MainAxisAlignment.start,
//                   //                       crossAxisAlignment: CrossAxisAlignment.start,
//                   //                       children: [
//                   //                         Container(
//                   //                           //padding: EdgeInsets.only(left:5,top:5,),height:249,
//                   //                           child: RichText(
//                   //                               text: TextSpan(
//                   //                                   text: '',
//                   //                                   style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                   //                                       fontWeight: FontWeight.w700,fontSize: 50),
//                   //                                   children: <TextSpan>[
//                   //
//                   //                                     TextSpan(
//                   //                                       text: '     ✓  ',
//                   //                                       style: TextStyle(color: HexColor('#FFFFFF'),
//                   //                                           fontFamily: 'Poppins',fontWeight: FontWeight.w500,
//                   //                                           fontSize: 16,wordSpacing:5),
//                   //                                     ),
//                   //                                     TextSpan(
//                   //                                       text: 'Create an account ',
//                   //                                       style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                   //                                           fontWeight: FontWeight.w500,fontSize: 16),
//                   //                                     ),
//                   //                                   ]
//                   //
//                   //                               )
//                   //                           ),
//                   //                         ),
//                   //                         SizedBox(height: 10,),
//                   //                         Container(
//                   //                           //padding: EdgeInsets.only(left:5,top:5,),height:249,
//                   //                           child: RichText(
//                   //                               text: TextSpan(
//                   //                                   text: '',
//                   //                                   style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                   //                                       fontWeight: FontWeight.w700,fontSize: 50),
//                   //                                   children: <TextSpan>[
//                   //
//                   //                                     TextSpan(
//                   //                                       text: '     ✓  ',
//                   //                                       style: TextStyle(color: HexColor('#FFFFFF'),
//                   //                                           fontFamily: 'Poppins',fontWeight: FontWeight.w500,
//                   //                                           fontSize: 16,wordSpacing:5),
//                   //                                     ),
//                   //                                     TextSpan(
//                   //                                       text: 'Up to 20 slots for stuffys in the'
//                   //                                           '   \n           gallery ',
//                   //                                       style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                   //                                           fontWeight: FontWeight.w500,fontSize: 16),
//                   //                                     ),
//                   //                                   ]
//                   //
//                   //                               )
//                   //                           ),
//                   //                         ),
//                   //                         SizedBox(height: 10,),
//                   //                         Container(
//                   //                           //padding: EdgeInsets.only(left:5,top:5,),height:249,
//                   //                           child: RichText(
//                   //                               text: TextSpan(
//                   //                                   text: '',
//                   //                                   style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                   //                                       fontWeight: FontWeight.w700,fontSize: 50),
//                   //                                   children: <TextSpan>[
//                   //
//                   //                                     TextSpan(
//                   //                                       text: '     ✓  ',
//                   //                                       style: TextStyle(color: HexColor('#FFFFFF'),
//                   //                                           fontFamily: 'Poppins',fontWeight: FontWeight.w500,
//                   //                                           fontSize: 16,wordSpacing:5),
//                   //                                     ),
//                   //                                     TextSpan(
//                   //                                       text: 'Connect with friends ',
//                   //                                       style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                   //                                           fontWeight: FontWeight.w500,fontSize: 16),
//                   //                                     ),
//                   //                                   ]
//                   //
//                   //                               )
//                   //                           ),
//                   //                         ),
//                   //                         SizedBox(height: 10,width: 20,),
//                   //                         Container(
//                   //                           //padding: EdgeInsets.only(left:5,top:5,),height:249,
//                   //                           child: RichText(
//                   //                               text: TextSpan(
//                   //                                   text: '',
//                   //                                   style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                   //                                       fontWeight: FontWeight.w700,fontSize: 50),
//                   //                                   children: <TextSpan>[
//                   //
//                   //                                     TextSpan(
//                   //                                       text: '     ✓  ',
//                   //                                       style: TextStyle(color: HexColor('#FFFFFF'),
//                   //                                           fontFamily: 'Poppins',fontWeight: FontWeight.w500,
//                   //                                           fontSize: 16,wordSpacing:5),
//                   //                                     ),
//                   //                                     TextSpan(
//                   //                                       text: 'Create a sprite out of a'
//                   //                                           '\n           stuffy ',
//                   //                                       style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                   //                                           fontWeight: FontWeight.w500,fontSize: 16),
//                   //                                     ),
//                   //                                   ]
//                   //
//                   //                               )
//                   //                           ),
//                   //                         ),
//                   //                         SizedBox(height: 10,),
//                   //                         Container(
//                   //                           //padding: EdgeInsets.only(left:5,top:5,),height:249,
//                   //                           child: RichText(
//                   //                               text: TextSpan(
//                   //                                   text: '',
//                   //                                   style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                   //                                       fontWeight: FontWeight.w700,fontSize: 50),
//                   //                                   children: <TextSpan>[
//                   //
//                   //                                     TextSpan(
//                   //                                       text: '     ✓  ',
//                   //                                       style: TextStyle(color: HexColor('#FFFFFF'),
//                   //                                           fontFamily: 'Poppins',fontWeight: FontWeight.w500,
//                   //                                           fontSize: 16,wordSpacing:5),
//                   //                                     ),
//                   //                                     TextSpan(
//                   //                                       text: 'Ability to make single-frame'
//                   //                                           '\n           images of stuffy to decorate ',
//                   //                                       style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                   //                                           fontWeight: FontWeight.w500,fontSize: 16),
//                   //                                     ),
//                   //                                   ]
//                   //
//                   //                               )
//                   //                           ),
//                   //                         ),
//                   //                         SizedBox(height: 10,),
//                   //                         Container(
//                   //                           //padding: EdgeInsets.only(left:5,top:5,),height:249,
//                   //                           child: RichText(
//                   //                               text: TextSpan(
//                   //                                   text: '',
//                   //                                   style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                   //                                       fontWeight: FontWeight.w700,fontSize: 50),
//                   //                                   children: <TextSpan>[
//                   //
//                   //                                     TextSpan(
//                   //                                       text: '     ✓  ',
//                   //                                       style: TextStyle(color: HexColor('#FFFFFF'),
//                   //                                           fontFamily: 'Poppins',fontWeight: FontWeight.w500,
//                   //                                           fontSize: 16,wordSpacing:5),
//                   //                                     ),
//                   //                                     TextSpan(
//                   //                                       text: 'Ability to add text to'
//                   //                                           '\n           images ',
//                   //                                       style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                   //                                           fontWeight: FontWeight.w500,fontSize: 16),
//                   //                                     ),
//                   //                                   ]
//                   //
//                   //                               )
//                   //                           ),
//                   //                         ),
//                   //                         Align(alignment:Alignment.bottomCenter ,
//                   //                           child: InkWell(
//                   //                             onTap: (){
//                   //                               Navigator.push(context, MaterialPageRoute(
//                   //                                   builder: (_)=>MProfile()));
//                   //                             },
//                   //                             child:  Container(
//                   //                               margin: const EdgeInsets.only(left:1,top:59,right:1),
//                   //                               decoration: BoxDecoration(
//                   //                                 shape: BoxShape.rectangle,
//                   //                                 color: HexColor('#86C33C'),
//                   //                                 borderRadius: const BorderRadius.only(
//                   //                                   bottomRight: Radius.circular(25),
//                   //                                   bottomLeft: Radius.circular(25),
//                   //                                 ),
//                   //                               ),
//                   //                               width: 319,
//                   //                               // width :MediaQuery.of(context).size.width,
//                   //                               // height:MediaQuery.of(context).size.height ,
//                   //                               height:60,
//                   //                               child: Center(
//                   //                                 child:  Text('Active',style:TextStyle(
//                   //                                     fontSize:16,fontWeight: FontWeight.w700,fontFamily: 'Poppins',
//                   //                                     color: HexColor ('#FFFFFF') ),),
//                   //                               ),
//                   //                             ),
//                   //                           ),
//                   //                         ),
//                   //                       ],
//                   //                     ),
//                   //                   ],
//                   //                 ),
//                   //               ),
//                   //             ),
//                   //           ),
//                   //
//                   //       SizedBox(height: 20),
//                   //       SmoothPageIndicator(
//                   //           controller:_controller,
//                   //         count:2 ,
//                   //         axisDirection: Axis.horizontal,
//                   //         effect: ExpandingDotsEffect(
//                   //           activeDotColor: HexColor('#999999'),
//                   //           dotColor: HexColor('#D0D0D0'),
//                   //           dotWidth: 13,
//                   //           dotHeight: 8,
//                   //         ),
//                   //       ),
//                   //
//                   //           // Container(
//                   //           //   padding: EdgeInsets.only(top: 20),
//                   //           //   child: SvgPicture.asset('asset/new icons/Slider Indicator.svg'),
//                   //           // )
//                   //           // DetailsPage(title: 'DetailsPage',)
//                   //         ],
//                   //       ),
//                   //     ): Container(
//                   //       height: 510,width: MediaQuery.of(context).size.width,
//                   //       color:HexColor('#F5F5F5'),
//                   //       child:  Column(
//                   //         children: [
//                   //           Container(
//                   //             alignment: Alignment.topCenter,
//                   //             margin: EdgeInsets.only(left:12,top:42),
//                   //             child: Center(
//                   //               child: Text('Premium Plan',style: TextStyle(
//                   //                   fontWeight: FontWeight.w400,
//                   //                   fontSize: 28,
//                   //                   fontFamily: 'Aboshi',
//                   //                   color: HexColor('#000000'))),
//                   //             ),
//                   //           ),
//                   //           SizedBox(height: 20),
//                   //           Card(
//                   //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
//                   //             color: HexColor('#03A9D6'),
//                   //             child: SizedBox(width: 319,
//                   //               child:  Container(
//                   //                 // padding: EdgeInsets.all(10),
//                   //                 decoration: BoxDecoration(
//                   //                   borderRadius: BorderRadius.circular(20),
//                   //                 ),
//                   //                 child: Column
//                   //                   (mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //                   crossAxisAlignment: CrossAxisAlignment.start,
//                   //                   children: [
//                   //                     Row(
//                   //                       children: [
//                   //                         Container(
//                   //                           alignment: Alignment.topCenter,
//                   //                           padding: EdgeInsets.only(left:90,top:1),
//                   //                           child: RichText(
//                   //                             textAlign: TextAlign.start,
//                   //                             text: TextSpan(
//                   //                                 text: '',
//                   //                                 style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                   //                                     fontWeight: FontWeight.w700,fontSize: 50),
//                   //
//                   //                                 children: <TextSpan>[
//                   //                                   TextSpan(
//                   //                                     text: '\$ ',
//                   //                                     style: TextStyle(color: HexColor('#FFFFFF'),
//                   //                                         fontFamily: 'Poppins',fontWeight: FontWeight.w600,
//                   //                                         fontSize: 18,wordSpacing:5),
//                   //                                   ),
//                   //                                   TextSpan(
//                   //                                     text: '120',
//                   //                                     style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                   //                                         fontWeight: FontWeight.w700,fontSize: 50),
//                   //                                   ),
//                   //                                   TextSpan(
//                   //                                     text: '/Month',
//                   //                                     style: TextStyle(color: HexColor('#FFFFFF'),
//                   //                                         fontFamily: 'Poppins',fontWeight: FontWeight.w600,
//                   //                                         fontSize: 18,wordSpacing:5),
//                   //                                   ),
//                   //
//                   //                                 ]
//                   //                             ),
//                   //                           ),
//                   //                         ),
//                   //
//                   //                       ],
//                   //                     ),
//                   //                     Container(
//                   //                       height: 1,
//                   //                       width:319,
//                   //                       color: HexColor('#FFFFFF'),
//                   //                     ),
//                   //                     SizedBox(height: 20),
//                   //                     Column(
//                   //                       mainAxisAlignment: MainAxisAlignment.start,
//                   //                       crossAxisAlignment: CrossAxisAlignment.start,
//                   //                       children: [
//                   //                         Container(
//                   //                           //padding: EdgeInsets.only(left:5,top:5,),height:249,
//                   //                           child: RichText(
//                   //                               text: TextSpan(
//                   //                                   text: '',
//                   //                                   style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                   //                                       fontWeight: FontWeight.w700,fontSize: 50),
//                   //                                   children: <TextSpan>[
//                   //
//                   //                                     TextSpan(
//                   //                                       text: '     ✓  ',
//                   //                                       style: TextStyle(color: HexColor('#FFFFFF'),
//                   //                                           fontFamily: 'Poppins',fontWeight: FontWeight.w500,
//                   //                                           fontSize: 16,wordSpacing:5),
//                   //                                     ),
//                   //                                     TextSpan(
//                   //                                       text: 'Purchase more QR code labels',
//                   //                                       style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                   //                                           fontWeight: FontWeight.w500,fontSize: 16),
//                   //                                     ),
//                   //                                   ]
//                   //
//                   //                               )
//                   //                           ),
//                   //                         ),
//                   //                         SizedBox(height: 10,),
//                   //                         Container(
//                   //                           //padding: EdgeInsets.only(left:5,top:5,),height:249,
//                   //                           child: RichText(
//                   //                               text: TextSpan(
//                   //                                   text: '',
//                   //                                   style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                   //                                       fontWeight: FontWeight.w700,fontSize: 50),
//                   //                                   children: <TextSpan>[
//                   //
//                   //                                     TextSpan(
//                   //                                       text: '     ✓  ',
//                   //                                       style: TextStyle(color: HexColor('#FFFFFF'),
//                   //                                           fontFamily: 'Poppins',fontWeight: FontWeight.w500,
//                   //                                           fontSize: 16,wordSpacing:5),
//                   //                                     ),
//                   //                                     TextSpan(
//                   //                                       text: 'Ability to create comic strips '
//                   //                                           '   \n           and videos',
//                   //                                       style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                   //                                           fontWeight: FontWeight.w500,fontSize: 16),
//                   //                                     ),
//                   //                                   ]
//                   //
//                   //                               )
//                   //                           ),
//                   //                         ),
//                   //                         SizedBox(height: 10,),
//                   //                         Container(
//                   //                           //padding: EdgeInsets.only(left:5,top:5,),height:249,
//                   //                           child: RichText(
//                   //                               text: TextSpan(
//                   //                                   text: '',
//                   //                                   style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                   //                                       fontWeight: FontWeight.w700,fontSize: 50),
//                   //                                   children: <TextSpan>[
//                   //
//                   //                                     TextSpan(
//                   //                                       text: '     ✓  ',
//                   //                                       style: TextStyle(color: HexColor('#FFFFFF'),
//                   //                                           fontFamily: 'Poppins',fontWeight: FontWeight.w500,
//                   //                                           fontSize: 16,wordSpacing:5),
//                   //                                     ),
//                   //                                     TextSpan(
//                   //                                       text: 'More stuffy slots in gallery',
//                   //                                       style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                   //                                           fontWeight: FontWeight.w500,fontSize: 16),
//                   //                                     ),
//                   //                                   ]
//                   //
//                   //                               )
//                   //                           ),
//                   //                         ),
//                   //                         SizedBox(height: 10,),
//                   //                         Container(
//                   //                           //padding: EdgeInsets.only(left:5,top:5,),height:249,
//                   //                           child: RichText(
//                   //                               text: TextSpan(
//                   //                                   text: '',
//                   //                                   style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                   //                                       fontWeight: FontWeight.w700,fontSize: 50),
//                   //                                   children: <TextSpan>[
//                   //
//                   //                                     TextSpan(
//                   //                                       text: '     ✓  ',
//                   //                                       style: TextStyle(color: HexColor('#FFFFFF'),
//                   //                                           fontFamily: 'Poppins',fontWeight: FontWeight.w500,
//                   //                                           fontSize: 16,wordSpacing:5),
//                   //                                     ),
//                   //                                     TextSpan(
//                   //                                       text: 'Ability to create greeting '
//                   //                                           '\n           cards ',
//                   //                                       style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                   //                                           fontWeight: FontWeight.w500,fontSize: 16),
//                   //                                     ),
//                   //                                   ]
//                   //
//                   //                               )
//                   //                           ),
//                   //                         ),
//                   //                         SizedBox(height: 10,),
//                   //                         Container(
//                   //                           //padding: EdgeInsets.only(left:5,top:5,),height:249,
//                   //                           child: RichText(
//                   //                               text: TextSpan(
//                   //                                   text: '',
//                   //                                   style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                   //                                       fontWeight: FontWeight.w700,fontSize: 50),
//                   //                                   children: <TextSpan>[
//                   //
//                   //                                     TextSpan(
//                   //                                       text: '     ✓  ',
//                   //                                       style: TextStyle(color: HexColor('#FFFFFF'),
//                   //                                           fontFamily: 'Poppins',fontWeight: FontWeight.w500,
//                   //                                           fontSize: 16,wordSpacing:5),
//                   //                                     ),
//                   //                                     TextSpan(
//                   //                                       text: 'Ability to make stop-motion'
//                   //                                           '\n           animation videos ',
//                   //                                       style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                   //                                           fontWeight: FontWeight.w500,fontSize: 16),
//                   //                                     ),
//                   //                                   ]
//                   //
//                   //                               )
//                   //                           ),
//                   //                         ),
//                   //                         SizedBox(height: 10,),
//                   //                         Container(
//                   //                           //padding: EdgeInsets.only(left:5,top:5,),height:249,
//                   //                           child: RichText(
//                   //                               text: TextSpan(
//                   //                                   text: '',
//                   //                                   style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                   //                                       fontWeight: FontWeight.w700,fontSize: 50),
//                   //                                   children: <TextSpan>[
//                   //
//                   //                                     TextSpan(
//                   //                                       text: '     ✓  ',
//                   //                                       style: TextStyle(color: HexColor('#FFFFFF'),
//                   //                                           fontFamily: 'Poppins',fontWeight: FontWeight.w500,
//                   //                                           fontSize: 16,wordSpacing:5),
//                   //                                     ),
//                   //                                     TextSpan(
//                   //                                       text: 'Ability to post photos/movies'
//                   //                                           '\n           publicly online' ,
//                   //                                       style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                   //                                           fontWeight: FontWeight.w500,fontSize: 16),
//                   //                                     ),
//                   //                                   ]
//                   //
//                   //                               )
//                   //                           ),
//                   //                         ),
//                   //
//                   //                       ],
//                   //                     ),
//                   //                     SizedBox(height: 26,width: 319,
//                   //                     ),
//                   //                     Align(alignment:Alignment.bottomCenter ,
//                   //                       child: InkWell(
//                   //                         onTap: (){
//                   //                           Navigator.push(context, MaterialPageRoute(
//                   //                               builder: (_)=>MProfile()));
//                   //                         },
//                   //                         child:  Container(
//                   //                           margin: EdgeInsets.only(left:1,top:31,right:1),
//                   //                           decoration: BoxDecoration(
//                   //                             shape: BoxShape.rectangle,
//                   //                             color: HexColor('#86C33C'),
//                   //                             borderRadius: BorderRadius.only(
//                   //                               bottomRight: Radius.circular(25),
//                   //                               bottomLeft: Radius.circular(25),
//                   //                             ),
//                   //                           ),
//                   //                           width: 319,//MediaQuery.of(context).size.width,
//                   //                           height:60,
//                   //                           child: Center(
//                   //                             child:  Text('upgrade',style:TextStyle(
//                   //                                 fontSize:16,fontWeight: FontWeight.w700,fontFamily: 'Poppins',
//                   //                                 color: HexColor ('#FFFFFF') ),),
//                   //                           ),
//                   //                         ),
//                   //                       ),
//                   //                     )
//                   //                   ],
//                   //                 ),
//                   //               ),
//                   //             ),
//                   //           ),
//                   //           // DetailsPage(title: 'DetailsPage',)
//                   //              Container(
//                   //                padding: EdgeInsets.only(top: 20),
//                   //                child: SvgPicture.asset('asset/new icons/Slider Indicator 3.svg'),
//                   //              )
//                   //         ],
//                   //       ),
//                   //     );
//                   //
//                   //   },
//                   //
//                   // ),
//                 ),
//                 SmoothPageIndicator(
//                   controller:controller,
//                   count:2 ,
//                   axisDirection: Axis.horizontal,
//                   effect: ExpandingDotsEffect(
//                     activeDotColor: HexColor('#999999'),
//                     dotColor: HexColor('#D0D0D0'),
//                     dotWidth: 13,
//                     dotHeight: 8,
//                   ),
//                 ),
//              ]
//           ),
//         ),
//     );
//   }
// }
//
//
//
//
