// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';
//
// import '../Screens/Profile.dart';
//
//
// class Plan_Page1 extends StatelessWidget {
//   const Plan_Page1({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//        width: MediaQuery.of(context).size.width,
//         // color: Colors,
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 alignment: Alignment.topCenter,
//                 margin: EdgeInsets.only(left:12,top:42),
//                 child: Center(
//                   child: Text('Free Plan',style: TextStyle(
//                       fontWeight: FontWeight.w400,
//                       fontSize: 28,
//                       fontFamily: 'Aboshi',
//                       color: HexColor('#000000'))),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Card(
//                 // margin: EdgeInsets.symmetric(horizontal: 29, vertical: 7),
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
//                 color: HexColor('#03A9D6'),
//                 child: SizedBox(
//                   width: 319,
//                   child:  Container(
//                     // padding: EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(50),
//                     ),
//                     child: Column
//                       (mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Container(
//                               alignment: Alignment.topCenter,
//                               padding: EdgeInsets.only(left:90,top:1),
//                               child: RichText(
//                                 textAlign: TextAlign.start,
//                                 text: TextSpan(
//                                     text: '',
//                                     style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                                         fontWeight: FontWeight.w700,fontSize: 50),
//
//                                     children: <TextSpan>[
//                                       TextSpan(
//                                         text: '\$ ',
//                                         style: TextStyle(color: HexColor('#FFFFFF'),
//                                             fontFamily: 'Poppins',fontWeight: FontWeight.w600,
//                                             fontSize: 18,wordSpacing:5),
//                                       ),
//                                       TextSpan(
//                                         text: '0',
//                                         style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                                             fontWeight: FontWeight.w700,fontSize: 50),
//                                       ),
//                                       TextSpan(
//                                         text: '/Month',
//                                         style: TextStyle(color: HexColor('#FFFFFF'),
//                                             fontFamily: 'Poppins',fontWeight: FontWeight.w600,
//                                             fontSize: 18,wordSpacing:5),
//                                       ),
//
//                                     ]
//                                 ),
//                               ),
//                             ),
//
//                           ],
//                         ),
//
//                         Container(
//                           // width: MediaQuery.of(context).size.width,
//                           // height: MediaQuery.of(context).size.height * 0.70,
//                           height: 1,
//                           width:319 ,
//                           color: HexColor('#FFFFFF'),
//                         ),
//                         SizedBox(height: 20),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               //padding: EdgeInsets.only(left:5,top:5,),height:249,
//                               child: RichText(
//                                   text: TextSpan(
//                                       text: '',
//                                       style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                                           fontWeight: FontWeight.w700,fontSize: 50),
//                                       children: <TextSpan>[
//
//                                         TextSpan(
//                                           text: '     ✓  ',
//                                           style: TextStyle(color: HexColor('#FFFFFF'),
//                                               fontFamily: 'Poppins',fontWeight: FontWeight.w500,
//                                               fontSize: 16,wordSpacing:5),
//                                         ),
//                                         TextSpan(
//                                           text: 'Create an account ',
//                                           style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                                               fontWeight: FontWeight.w500,fontSize: 16),
//                                         ),
//                                       ]
//
//                                   )
//                               ),
//                             ),
//                             SizedBox(height: 10,),
//                             Container(
//                               //padding: EdgeInsets.only(left:5,top:5,),height:249,
//                               child: RichText(
//                                   text: TextSpan(
//                                       text: '',
//                                       style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                                           fontWeight: FontWeight.w700,fontSize: 50),
//                                       children: <TextSpan>[
//
//                                         TextSpan(
//                                           text: '     ✓  ',
//                                           style: TextStyle(color: HexColor('#FFFFFF'),
//                                               fontFamily: 'Poppins',fontWeight: FontWeight.w500,
//                                               fontSize: 16,wordSpacing:5),
//                                         ),
//                                         TextSpan(
//                                           text: 'Up to 20 slots for stuffys in the'
//                                               '   \n           gallery ',
//                                           style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                                               fontWeight: FontWeight.w500,fontSize: 16),
//                                         ),
//                                       ]
//
//                                   )
//                               ),
//                             ),
//                             SizedBox(height: 10,),
//                             Container(
//                               //padding: EdgeInsets.only(left:5,top:5,),height:249,
//                               child: RichText(
//                                   text: TextSpan(
//                                       text: '',
//                                       style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                                           fontWeight: FontWeight.w700,fontSize: 50),
//                                       children: <TextSpan>[
//
//                                         TextSpan(
//                                           text: '     ✓  ',
//                                           style: TextStyle(color: HexColor('#FFFFFF'),
//                                               fontFamily: 'Poppins',fontWeight: FontWeight.w500,
//                                               fontSize: 16,wordSpacing:5),
//                                         ),
//                                         TextSpan(
//                                           text: 'Connect with friends ',
//                                           style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                                               fontWeight: FontWeight.w500,fontSize: 16),
//                                         ),
//                                       ]
//
//                                   )
//                               ),
//                             ),
//                             SizedBox(height: 10,width: 20,),
//                             Container(
//                               //padding: EdgeInsets.only(left:5,top:5,),height:249,
//                               child: RichText(
//                                   text: TextSpan(
//                                       text: '',
//                                       style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                                           fontWeight: FontWeight.w700,fontSize: 50),
//                                       children: <TextSpan>[
//
//                                         TextSpan(
//                                           text: '     ✓  ',
//                                           style: TextStyle(color: HexColor('#FFFFFF'),
//                                               fontFamily: 'Poppins',fontWeight: FontWeight.w500,
//                                               fontSize: 16,wordSpacing:5),
//                                         ),
//                                         TextSpan(
//                                           text: 'Create a sprite out of a'
//                                               '\n           stuffy ',
//                                           style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                                               fontWeight: FontWeight.w500,fontSize: 16),
//                                         ),
//                                       ]
//
//                                   )
//                               ),
//                             ),
//                             SizedBox(height: 10,),
//                             Container(
//                               //padding: EdgeInsets.only(left:5,top:5,),height:249,
//                               child: RichText(
//                                   text: TextSpan(
//                                       text: '',
//                                       style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                                           fontWeight: FontWeight.w700,fontSize: 50),
//                                       children: <TextSpan>[
//
//                                         TextSpan(
//                                           text: '     ✓  ',
//                                           style: TextStyle(color: HexColor('#FFFFFF'),
//                                               fontFamily: 'Poppins',fontWeight: FontWeight.w500,
//                                               fontSize: 16,wordSpacing:5),
//                                         ),
//                                         TextSpan(
//                                           text: 'Ability to make single-frame'
//                                               '\n           images of stuffy to decorate ',
//                                           style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                                               fontWeight: FontWeight.w500,fontSize: 16),
//                                         ),
//                                       ]
//
//                                   )
//                               ),
//                             ),
//                             SizedBox(height: 10,),
//                             Container(
//                               //padding: EdgeInsets.only(left:5,top:5,),height:249,
//                               child: RichText(
//                                   text: TextSpan(
//                                       text: '',
//                                       style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                                           fontWeight: FontWeight.w700,fontSize: 50),
//                                       children: <TextSpan>[
//
//                                         TextSpan(
//                                           text: '     ✓  ',
//                                           style: TextStyle(color: HexColor('#FFFFFF'),
//                                               fontFamily: 'Poppins',fontWeight: FontWeight.w500,
//                                               fontSize: 16,wordSpacing:5),
//                                         ),
//                                         TextSpan(
//                                           text: 'Ability to add text to'
//                                               '\n           images ',
//                                           style: TextStyle(color: HexColor('#FFFFFF'), fontFamily: 'Poppins',
//                                               fontWeight: FontWeight.w500,fontSize: 16),
//                                         ),
//                                       ]
//
//                                   )
//                               ),
//                             ),
//                             Align(alignment:Alignment.bottomCenter ,
//                               child: InkWell(
//                                 onTap: (){
//                                   Navigator.push(context, MaterialPageRoute(
//                                       builder: (_)=>MProfile()));
//                                 },
//                                 child:  Container(
//                                   margin: const EdgeInsets.only(left:1,top:59,right:1),
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.rectangle,
//                                     color: HexColor('#86C33C'),
//                                     borderRadius: const BorderRadius.only(
//                                       bottomRight: Radius.circular(25),
//                                       bottomLeft: Radius.circular(25),
//                                     ),
//                                   ),
//                                   width: 319,
//                                   // width :MediaQuery.of(context).size.width,
//                                   // height:MediaQuery.of(context).size.height ,
//                                   height:60,
//                                   child: Center(
//                                     child:  Text('Active',style:TextStyle(
//                                         fontSize:16,fontWeight: FontWeight.w700,fontFamily: 'Poppins',
//                                         color: HexColor ('#FFFFFF') ),),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
