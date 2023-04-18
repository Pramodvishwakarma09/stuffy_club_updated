// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:hexcolor/hexcolor.dart';
//
// import '../Screens/Profile.dart';
//
//
// class Plan_Page2 extends StatelessWidget {
//   const Plan_Page2({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         color:HexColor('#F5F5F5'),
//         child:  Column(
//           children: [
//             Container(
//               alignment: Alignment.topCenter,
//               margin: EdgeInsets.only(left:12,top:42),
//               child: Center(
//                 child: Text('Premium Plan',style: TextStyle(
//                     fontWeight: FontWeight.w400,
//                     fontSize: 28,
//                     fontFamily: 'Aboshi',
//                     color: HexColor('#000000'))),
//               ),
//             ),
//             SizedBox(height: 20),
//             Card(
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
//               color: HexColor('#03A9D6'),
//               child: SizedBox(width: 319,
//                 child:  Container(
//                   // padding: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Column
//                     (mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Container(
//                             alignment: Alignment.topCenter,
//                             padding: EdgeInsets.only(left:90,top:1),
//                             child: RichText(
//                               textAlign: TextAlign.start,
//                               text: TextSpan(
//                                   text: '',
//                                   style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                                       fontWeight: FontWeight.w700,fontSize: 50),
//
//                                   children: <TextSpan>[
//                                     TextSpan(
//                                       text: '\$ ',
//                                       style: TextStyle(color: HexColor('#FFFFFF'),
//                                           fontFamily: 'Poppins',fontWeight: FontWeight.w600,
//                                           fontSize: 18,wordSpacing:5),
//                                     ),
//                                     TextSpan(
//                                       text: '120',
//                                       style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                                           fontWeight: FontWeight.w700,fontSize: 50),
//                                     ),
//                                     TextSpan(
//                                       text: '/Month',
//                                       style: TextStyle(color: HexColor('#FFFFFF'),
//                                           fontFamily: 'Poppins',fontWeight: FontWeight.w600,
//                                           fontSize: 18,wordSpacing:5),
//                                     ),
//
//                                   ]
//                               ),
//                             ),
//                           ),
//
//                         ],
//                       ),
//                       Container(
//                         height: 1,
//                         width:319,
//                         color: HexColor('#FFFFFF'),
//                       ),
//                       SizedBox(height: 20),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             //padding: EdgeInsets.only(left:5,top:5,),height:249,
//                             child: RichText(
//                                 text: TextSpan(
//                                     text: '',
//                                     style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                                         fontWeight: FontWeight.w700,fontSize: 50),
//                                     children: <TextSpan>[
//
//                                       TextSpan(
//                                         text: '     ✓  ',
//                                         style: TextStyle(color: HexColor('#FFFFFF'),
//                                             fontFamily: 'Poppins',fontWeight: FontWeight.w500,
//                                             fontSize: 16,wordSpacing:5),
//                                       ),
//                                       TextSpan(
//                                         text: 'Purchase more QR code labels',
//                                         style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                                             fontWeight: FontWeight.w500,fontSize: 16),
//                                       ),
//                                     ]
//
//                                 )
//                             ),
//                           ),
//                           SizedBox(height: 10,),
//                           Container(
//                             //padding: EdgeInsets.only(left:5,top:5,),height:249,
//                             child: RichText(
//                                 text: TextSpan(
//                                     text: '',
//                                     style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                                         fontWeight: FontWeight.w700,fontSize: 50),
//                                     children: <TextSpan>[
//
//                                       TextSpan(
//                                         text: '     ✓  ',
//                                         style: TextStyle(color: HexColor('#FFFFFF'),
//                                             fontFamily: 'Poppins',fontWeight: FontWeight.w500,
//                                             fontSize: 16,wordSpacing:5),
//                                       ),
//                                       TextSpan(
//                                         text: 'Ability to create comic strips '
//                                             '   \n           and videos',
//                                         style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                                             fontWeight: FontWeight.w500,fontSize: 16),
//                                       ),
//                                     ]
//
//                                 )
//                             ),
//                           ),
//                           SizedBox(height: 10,),
//                           Container(
//                             //padding: EdgeInsets.only(left:5,top:5,),height:249,
//                             child: RichText(
//                                 text: TextSpan(
//                                     text: '',
//                                     style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                                         fontWeight: FontWeight.w700,fontSize: 50),
//                                     children: <TextSpan>[
//
//                                       TextSpan(
//                                         text: '     ✓  ',
//                                         style: TextStyle(color: HexColor('#FFFFFF'),
//                                             fontFamily: 'Poppins',fontWeight: FontWeight.w500,
//                                             fontSize: 16,wordSpacing:5),
//                                       ),
//                                       TextSpan(
//                                         text: 'More stuffy slots in gallery',
//                                         style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                                             fontWeight: FontWeight.w500,fontSize: 16),
//                                       ),
//                                     ]
//
//                                 )
//                             ),
//                           ),
//                           SizedBox(height: 10,),
//                           Container(
//                             //padding: EdgeInsets.only(left:5,top:5,),height:249,
//                             child: RichText(
//                                 text: TextSpan(
//                                     text: '',
//                                     style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                                         fontWeight: FontWeight.w700,fontSize: 50),
//                                     children: <TextSpan>[
//
//                                       TextSpan(
//                                         text: '     ✓  ',
//                                         style: TextStyle(color: HexColor('#FFFFFF'),
//                                             fontFamily: 'Poppins',fontWeight: FontWeight.w500,
//                                             fontSize: 16,wordSpacing:5),
//                                       ),
//                                       TextSpan(
//                                         text: 'Ability to create greeting '
//                                             '\n           cards ',
//                                         style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                                             fontWeight: FontWeight.w500,fontSize: 16),
//                                       ),
//                                     ]
//
//                                 )
//                             ),
//                           ),
//                           SizedBox(height: 10,),
//                           Container(
//                             //padding: EdgeInsets.only(left:5,top:5,),height:249,
//                             child: RichText(
//                                 text: TextSpan(
//                                     text: '',
//                                     style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                                         fontWeight: FontWeight.w700,fontSize: 50),
//                                     children: <TextSpan>[
//
//                                       TextSpan(
//                                         text: '     ✓  ',
//                                         style: TextStyle(color: HexColor('#FFFFFF'),
//                                             fontFamily: 'Poppins',fontWeight: FontWeight.w500,
//                                             fontSize: 16,wordSpacing:5),
//                                       ),
//                                       TextSpan(
//                                         text: 'Ability to make stop-motion'
//                                             '\n           animation videos ',
//                                         style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                                             fontWeight: FontWeight.w500,fontSize: 16),
//                                       ),
//                                     ]
//
//                                 )
//                             ),
//                           ),
//                           SizedBox(height: 10,),
//                           Container(
//                             //padding: EdgeInsets.only(left:5,top:5,),height:249,
//                             child: RichText(
//                                 text: TextSpan(
//                                     text: '',
//                                     style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                                         fontWeight: FontWeight.w700,fontSize: 50),
//                                     children: <TextSpan>[
//
//                                       TextSpan(
//                                         text: '     ✓  ',
//                                         style: TextStyle(color: HexColor('#FFFFFF'),
//                                             fontFamily: 'Poppins',fontWeight: FontWeight.w500,
//                                             fontSize: 16,wordSpacing:5),
//                                       ),
//                                       TextSpan(
//                                         text: 'Ability to post photos/movies'
//                                             '\n           publicly online' ,
//                                         style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                                             fontWeight: FontWeight.w500,fontSize: 16),
//                                       ),
//                                     ]
//
//                                 )
//                             ),
//                           ),
//
//                         ],
//                       ),
//                       SizedBox(height: 26,width: 319,
//                       ),
//                       Align(alignment:Alignment.bottomCenter ,
//                         child: InkWell(
//                           onTap: (){
//                             Navigator.push(context, MaterialPageRoute(
//                                 builder: (_)=>MProfile()));
//                           },
//                           child:  Container(
//                             margin: EdgeInsets.only(left:1,top:31,right:1),
//                             decoration: BoxDecoration(
//                               shape: BoxShape.rectangle,
//                               color: HexColor('#86C33C'),
//                               borderRadius: BorderRadius.only(
//                                 bottomRight: Radius.circular(25),
//                                 bottomLeft: Radius.circular(25),
//                               ),
//                             ),
//                             width: 319,//MediaQuery.of(context).size.width,
//                             height:60,
//                             child: Center(
//                               child:  Text('upgrade',style:TextStyle(
//                                   fontSize:16,fontWeight: FontWeight.w700,fontFamily: 'Poppins',
//                                   color: HexColor ('#FFFFFF') ),),
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             // DetailsPage(title: 'DetailsPage',)
//           ],
//         ),
//       ),
//     );
//   }
// }
