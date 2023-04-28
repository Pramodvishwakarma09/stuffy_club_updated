import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper_tv/flutter_swiper.dart';
import '../../../utils/constants/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:hexcolor/hexcolor.dart';

class Plans1 extends StatefulWidget {
  const Plans1({Key? key}) : super(key: key);

  @override
  State<Plans1> createState() => _Plans1State();
}

class _Plans1State extends State<Plans1> {
  List imageModel = ['2', '1'];
  int S = 0;
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        title: const Text('Premium Plan',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                fontFamily: 'Aoboshi One',
                color: colors.black1)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          color: colors.black1,
        ),
        actions: <Widget>[
          InkWell(
            onTap: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (_) => Condition()));
            },
            child: SvgPicture.asset('asset/new icons/Shape1.svg'),
          ),
          Padding(padding: EdgeInsets.only(left: 35, right: 2))
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            height: 700,
            width: MediaQuery.of(context).size.width,
            child: Swiper(
              itemCount: imageModel.length,
              layout: SwiperLayout.DEFAULT,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return index == 0
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        color: HexColor('#F5F5F5'),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topCenter,
                              margin: EdgeInsets.only(left: 12,),
                              child: Center(
                                child: Text('Premium Plan',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 28,
                                        fontFamily: 'Aboshi',
                                        color: colors.black1)),
                              ),
                            ),
                            SizedBox(height: 20),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              color: HexColor('#03A9D6'),
                              child: SizedBox(
                                width: 319,
                                child: Container(
                                  // padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            alignment: Alignment.topCenter,
                                            padding: EdgeInsets.only(
                                                left: 90, top: 1),
                                            child: RichText(
                                              textAlign: TextAlign.start,
                                              text: TextSpan(
                                                  text: '',
                                                  style: TextStyle(
                                                      color:
                                                          colors.whit,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 50),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: '\$ ',
                                                      style: TextStyle(
                                                          color: HexColor(
                                                              '#FFFFFF'),
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 18,
                                                          wordSpacing: 5),
                                                    ),
                                                    TextSpan(
                                                      text: '120',
                                                      style: TextStyle(
                                                          color: HexColor(
                                                              '#FFFFFF'),
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 50),
                                                    ),
                                                    TextSpan(
                                                      text: '/Month',
                                                      style: TextStyle(
                                                          color: HexColor(
                                                              '#FFFFFF'),
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 18,
                                                          wordSpacing: 5),
                                                    ),
                                                  ]),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 1,
                                        width: 319,
                                        color: colors.whit,
                                      ),
                                      SizedBox(height: 20),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            //padding: EdgeInsets.only(left:5,top:5,),height:249,
                                            child: RichText(
                                                text: TextSpan(
                                                    text: '',
                                                    style: TextStyle(
                                                        color:
                                                            colors.whit,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 50),
                                                    children: <TextSpan>[
                                                  TextSpan(
                                                    text: '     ✓  ',
                                                    style: TextStyle(
                                                        color:
                                                            colors.whit,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16,
                                                        wordSpacing: 5),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        'Purchase more QR code labels',
                                                    style: TextStyle(
                                                        color:
                                                            colors.whit,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16),
                                                  ),
                                                ])),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            //padding: EdgeInsets.only(left:5,top:5,),height:249,
                                            child: RichText(
                                                text: TextSpan(
                                                    text: '',
                                                    style: TextStyle(
                                                        color:
                                                            colors.whit,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 50),
                                                    children: <TextSpan>[
                                                  TextSpan(
                                                    text: '     ✓  ',
                                                    style: TextStyle(
                                                        color:
                                                            colors.whit,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16,
                                                        wordSpacing: 5),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        'Ability to create comic strips '
                                                        '   \n           and videos',
                                                    style: TextStyle(
                                                        color:
                                                            colors.whit,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16),
                                                  ),
                                                ])),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            //padding: EdgeInsets.only(left:5,top:5,),height:249,
                                            child: RichText(
                                                text: TextSpan(
                                                    text: '',
                                                    style: TextStyle(
                                                        color:
                                                            colors.whit,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 50),
                                                    children: <TextSpan>[
                                                  TextSpan(
                                                    text: '     ✓  ',
                                                    style: TextStyle(
                                                        color:
                                                            colors.whit,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16,
                                                        wordSpacing: 5),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        'More stuffy slots in gallery',
                                                    style: TextStyle(
                                                        color:
                                                            colors.whit,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16),
                                                  ),
                                                ])),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            //padding: EdgeInsets.only(left:5,top:5,),height:249,
                                            child: RichText(
                                                text: TextSpan(
                                                    text: '',
                                                    style: TextStyle(
                                                        color:
                                                            colors.whit,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 50),
                                                    children: <TextSpan>[
                                                  TextSpan(
                                                    text: '     ✓  ',
                                                    style: TextStyle(
                                                        color:
                                                            colors.whit,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16,
                                                        wordSpacing: 5),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        'Ability to create greeting '
                                                        '\n           cards ',
                                                    style: TextStyle(
                                                        color:
                                                            colors.whit,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16),
                                                  ),
                                                ])),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            //padding: EdgeInsets.only(left:5,top:5,),height:249,
                                            child: RichText(
                                                text: TextSpan(
                                                    text: '',
                                                    style: TextStyle(
                                                        color:
                                                            colors.whit,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 50),
                                                    children: <TextSpan>[
                                                  TextSpan(
                                                    text: '     ✓  ',
                                                    style: TextStyle(
                                                        color:
                                                            colors.whit,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16,
                                                        wordSpacing: 5),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        'Ability to make stop-motion'
                                                        '\n           animation videos ',
                                                    style: TextStyle(
                                                        color:
                                                            colors.whit,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16),
                                                  ),
                                                ])),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            //padding: EdgeInsets.only(left:5,top:5,),height:249,
                                            child: RichText(
                                                text: TextSpan(
                                                    text: '',
                                                    style: TextStyle(
                                                        color:
                                                            colors.whit,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 50),
                                                    children: <TextSpan>[
                                                  TextSpan(
                                                    text: '     ✓  ',
                                                    style: TextStyle(
                                                        color:
                                                            colors.whit,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16,
                                                        wordSpacing: 5),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        'Ability to post photos/movies'
                                                        '\n           publicly online',
                                                    style: TextStyle(
                                                        color:
                                                            colors.whit,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16),
                                                  ),
                                                ])),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 26,
                                        width: 319,
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: InkWell(
                                          onTap: () {
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (_) =>
                                            //             MProfile()));
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 1, top: 31, right: 1),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              color: HexColor('#86C33C'),
                                              borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(25),
                                                bottomLeft: Radius.circular(25),
                                              ),
                                            ),
                                            width:
                                                319, //MediaQuery.of(context).size.width,
                                            height: 60,
                                            child: Center(
                                              child: Text(
                                                'upgrade',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: 'Poppins',
                                                    color: colors.whit),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            SmoothPageIndicator(
                              controller: _controller,
                              count: 2,
                              axisDirection: Axis.horizontal,
                              effect: ExpandingDotsEffect(
                                activeDotColor: HexColor('#999999'),
                                dotColor: HexColor('#D0D0D0'),
                                dotWidth: 13,
                                dotHeight: 8,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        height: 510, width: MediaQuery.of(context).size.width,
                        // color: Colors,
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topCenter,
                              margin: EdgeInsets.only(left: 12,),
                              child: Center(
                                child: Text('Free Plan',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 28,
                                        fontFamily: 'Aboshi',
                                        color: colors.black1)),
                              ),
                            ),
                            SizedBox(height: 20),
                            Card(
                              // margin: EdgeInsets.symmetric(horizontal: 29, vertical: 7),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              color: HexColor('#03A9D6'),
                              child: SizedBox(
                                width: 319,
                                child: Container(
                                  // padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            alignment: Alignment.topCenter,
                                            padding: EdgeInsets.only(
                                                left: 90, top: 1),
                                            child: RichText(
                                              textAlign: TextAlign.start,
                                              text: TextSpan(
                                                  text: '',
                                                  style: TextStyle(
                                                      color:
                                                          colors.whit,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 50),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: '\$ ',
                                                      style: TextStyle(
                                                          color: HexColor(
                                                              '#FFFFFF'),
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 18,
                                                          wordSpacing: 5),
                                                    ),
                                                    TextSpan(
                                                      text: '0',
                                                      style: TextStyle(
                                                          color: HexColor(
                                                              '#FFFFFF'),
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 50),
                                                    ),
                                                    TextSpan(
                                                      text: '/Month',
                                                      style: TextStyle(
                                                          color: HexColor(
                                                              '#FFFFFF'),
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 18,
                                                          wordSpacing: 5),
                                                    ),
                                                  ]),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        // width: MediaQuery.of(context).size.width,
                                        // height: MediaQuery.of(context).size.height * 0.70,
                                        height: 1,
                                        width: 319,
                                        color: colors.whit,
                                      ),
                                      SizedBox(height: 20),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            //padding: EdgeInsets.only(left:5,top:5,),height:249,
                                            child: RichText(
                                                text: TextSpan(
                                                    text: '',
                                                    style: TextStyle(
                                                        color:
                                                            colors.whit,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 50),
                                                    children: <TextSpan>[
                                                  TextSpan(
                                                    text: '     ✓  ',
                                                    style: TextStyle(
                                                        color:
                                                            colors.whit,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16,
                                                        wordSpacing: 5),
                                                  ),
                                                  TextSpan(
                                                    text: 'Create an account ',
                                                    style: TextStyle(
                                                        color:
                                                            colors.whit,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16),
                                                  ),
                                                ])),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            //padding: EdgeInsets.only(left:5,top:5,),height:249,
                                            child: RichText(
                                                text: TextSpan(
                                                    text: '',
                                                    style: TextStyle(
                                                        color:
                                                            colors.whit,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 50),
                                                    children: <TextSpan>[
                                                  TextSpan(
                                                    text: '     ✓  ',
                                                    style: TextStyle(
                                                        color:
                                                            colors.whit,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16,
                                                        wordSpacing: 5),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        'Up to 20 slots for stuffys in the'
                                                        '   \n           gallery ',
                                                    style: TextStyle(
                                                        color:
                                                            colors.whit,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16),
                                                  ),
                                                ])),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            //padding: EdgeInsets.only(left:5,top:5,),height:249,
                                            child: RichText(
                                                text: TextSpan(
                                                    text: '',
                                                    style: TextStyle(
                                                        color:
                                                            colors.whit,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 50),
                                                    children: <TextSpan>[
                                                  TextSpan(
                                                    text: '     ✓  ',
                                                    style: TextStyle(
                                                        color:
                                                            colors.whit,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16,
                                                        wordSpacing: 5),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        'Connect with friends ',
                                                    style: TextStyle(
                                                        color:
                                                            colors.whit,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16),
                                                  ),
                                                ])),
                                          ),
                                          SizedBox(
                                            height: 10,
                                            width: 20,
                                          ),
                                          Container(
                                            //padding: EdgeInsets.only(left:5,top:5,),height:249,
                                            child: RichText(
                                                text: TextSpan(
                                                    text: '',
                                                    style: TextStyle(
                                                        color:
                                                            colors.whit,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 50),
                                                    children: <TextSpan>[
                                                  TextSpan(
                                                    text: '     ✓  ',
                                                    style: TextStyle(
                                                        color:
                                                            colors.whit,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16,
                                                        wordSpacing: 5),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        'Create a sprite out of a'
                                                        '\n           stuffy ',
                                                    style: TextStyle(
                                                        color:
                                                            colors.whit,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16),
                                                  ),
                                                ])),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            //padding: EdgeInsets.only(left:5,top:5,),height:249,
                                            child: RichText(
                                                text: TextSpan(
                                                    text: '',
                                                    style: TextStyle(
                                                        color:
                                                            colors.whit,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 50),
                                                    children: <TextSpan>[
                                                  TextSpan(
                                                    text: '     ✓  ',
                                                    style: TextStyle(
                                                        color:
                                                            colors.whit,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16,
                                                        wordSpacing: 5),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        'Ability to make single-frame'
                                                        '\n           images of stuffy to decorate ',
                                                    style: TextStyle(
                                                        color:
                                                            colors.whit,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16),
                                                  ),
                                                ])),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            //padding: EdgeInsets.only(left:5,top:5,),height:249,
                                            child: RichText(
                                                text: TextSpan(
                                                    text: '',
                                                    style: TextStyle(
                                                        color:
                                                            colors.whit,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 50),
                                                    children: <TextSpan>[
                                                  TextSpan(
                                                    text: '     ✓  ',
                                                    style: TextStyle(
                                                        color:
                                                            colors.whit,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16,
                                                        wordSpacing: 5),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        'Ability to add text to'
                                                        '\n           images ',
                                                    style: TextStyle(
                                                        color:
                                                            colors.whit,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16),
                                                  ),
                                                ])),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: InkWell(
                                              onTap: () {
                                                // Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //         builder: (_) =>
                                                //             MProfile()));
                                              },
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    left: 1, top: 59, right: 1),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  color: HexColor('#86C33C'),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(25),
                                                    bottomLeft:
                                                        Radius.circular(25),
                                                  ),
                                                ),
                                                width: 319,
                                                // width :MediaQuery.of(context).size.width,
                                                // height:MediaQuery.of(context).size.height ,
                                                height: 60,
                                                child: Center(
                                                  child: Text(
                                                    'Active',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontFamily: 'Poppins',
                                                        color: HexColor(
                                                            '#FFFFFF')),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            SmoothPageIndicator(
                              controller: _controller,
                              count: 2,
                              onDotClicked: (index) => _controller,
                              axisDirection: Axis.horizontal,
                              effect: ExpandingDotsEffect(
                                activeDotColor: HexColor('#999999'),
                                dotColor: HexColor('#D0D0D0'),
                                dotWidth: 13,
                                dotHeight: 8,
                              ),
                            ),
                          ],
                        ),
                      );
              },
            ),
          ),
        ]),
      ),
    );
  }
}

/*
  SingleChildScrollView(
               child: Center(
                 child: Column(
                     children: [
                       SizedBox(height: 42),
                       Container(
                         alignment: Alignment.topCenter,
                         margin: EdgeInsets.only(left:12,top:13),
                         child: Center(
                           child: Text('Premium Plan',style: TextStyle(
                               fontWeight: FontWeight.w400,
                               fontSize: 28,
                               fontFamily: 'Aboshi',
                               color: colors.black1)),
                         ),
                       ),
                       SizedBox(height: 32),
                       Card(
                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                         color: HexColor('#03A9D6'),
                         child: SizedBox(width: 319,height:460,
                           child:  Container(
                             // padding: EdgeInsets.all(10),
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(20),
                             ),
                             child: Column
                               (mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Row(
                                   children: [
                                     Container(
                                       alignment: Alignment.topCenter,
                                       padding: EdgeInsets.only(left:90,top:1),
                                       child: RichText(
                                         textAlign: TextAlign.start,
                                         text: TextSpan(
                                             text: '',
                                             style: TextStyle(color: colors.whit, fontFamily: 'Poppins',
                                                 fontWeight: FontWeight.w700,fontSize: 50),

                                             children: <TextSpan>[
                                               TextSpan(
                                                 text: '\$ ',
                                                 style: TextStyle(color: colors.whit,
                                                     fontFamily: 'Poppins',fontWeight: FontWeight.w600,
                                                     fontSize: 18,wordSpacing:5),
                                               ),
                                               TextSpan(
                                                 text: '120',
                                                 style: TextStyle(color: colors.whit, fontFamily: 'Poppins',
                                                     fontWeight: FontWeight.w700,fontSize: 50),
                                               ),
                                               TextSpan(
                                                 text: '/Month',
                                                 style: TextStyle(color: colors.whit,
                                                     fontFamily: 'Poppins',fontWeight: FontWeight.w600,
                                                     fontSize: 18,wordSpacing:5),
                                               ),

                                             ]
                                         ),
                                       ),
                                     ),

                                   ],
                                 ),
                                 Container(
                                   height: 1,
                                   width:319,
                                   color: colors.whit,
                                 ),
                                 SizedBox(height: 20),
                                 Column(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Container(
                                       //padding: EdgeInsets.only(left:5,top:5,),height:249,
                                       child: RichText(
                                           text: TextSpan(
                                               text: '',
                                               style: TextStyle(color: colors.whit, fontFamily: 'Poppins',
                                                   fontWeight: FontWeight.w700,fontSize: 50),
                                               children: <TextSpan>[

                                                 TextSpan(
                                                   text: '     ✓  ',
                                                   style: TextStyle(color: colors.whit,
                                                       fontFamily: 'Poppins',fontWeight: FontWeight.w500,
                                                       fontSize: 16,wordSpacing:5),
                                                 ),
                                                 TextSpan(
                                                   text: 'Purchase more QR code labels',
                                                   style: TextStyle(color: colors.whit, fontFamily: 'Poppins',
                                                       fontWeight: FontWeight.w500,fontSize: 16),
                                                 ),
                                               ]

                                           )
                                       ),
                                     ),
                                     SizedBox(height: 10,),
                                     Container(
                                       //padding: EdgeInsets.only(left:5,top:5,),height:249,
                                       child: RichText(
                                           text: TextSpan(
                                               text: '',
                                               style: TextStyle(color: colors.whit, fontFamily: 'Poppins',
                                                   fontWeight: FontWeight.w700,fontSize: 50),
                                               children: <TextSpan>[

                                                 TextSpan(
                                                   text: '     ✓  ',
                                                   style: TextStyle(color: colors.whit,
                                                       fontFamily: 'Poppins',fontWeight: FontWeight.w500,
                                                       fontSize: 16,wordSpacing:5),
                                                 ),
                                                 TextSpan(
                                                   text: 'Ability to create comic strips '
                                                       '   \n           and videos',
                                                   style: TextStyle(color: colors.whit, fontFamily: 'Poppins',
                                                       fontWeight: FontWeight.w500,fontSize: 16),
                                                 ),
                                               ]

                                           )
                                       ),
                                     ),
                                     SizedBox(height: 10,),
                                     Container(
                                       //padding: EdgeInsets.only(left:5,top:5,),height:249,
                                       child: RichText(
                                           text: TextSpan(
                                               text: '',
                                               style: TextStyle(color: colors.whit, fontFamily: 'Poppins',
                                                   fontWeight: FontWeight.w700,fontSize: 50),
                                               children: <TextSpan>[

                                                 TextSpan(
                                                   text: '     ✓  ',
                                                   style: TextStyle(color: colors.whit,
                                                       fontFamily: 'Poppins',fontWeight: FontWeight.w500,
                                                       fontSize: 16,wordSpacing:5),
                                                 ),
                                                 TextSpan(
                                                   text: 'More stuffy slots in gallery',
                                                   style: TextStyle(color: colors.whit, fontFamily: 'Poppins',
                                                       fontWeight: FontWeight.w500,fontSize: 16),
                                                 ),
                                               ]

                                           )
                                       ),
                                     ),
                                     SizedBox(height: 10,),
                                     Container(
                                       //padding: EdgeInsets.only(left:5,top:5,),height:249,
                                       child: RichText(
                                           text: TextSpan(
                                               text: '',
                                               style: TextStyle(color: colors.whit, fontFamily: 'Poppins',
                                                   fontWeight: FontWeight.w700,fontSize: 50),
                                               children: <TextSpan>[

                                                 TextSpan(
                                                   text: '     ✓  ',
                                                   style: TextStyle(color: colors.whit,
                                                       fontFamily: 'Poppins',fontWeight: FontWeight.w500,
                                                       fontSize: 16,wordSpacing:5),
                                                 ),
                                                 TextSpan(
                                                   text: 'Ability to create greeting '
                                                       '\n           cards ',
                                                   style: TextStyle(color: colors.whit, fontFamily: 'Poppins',
                                                       fontWeight: FontWeight.w500,fontSize: 16),
                                                 ),
                                               ]

                                           )
                                       ),
                                     ),
                                     SizedBox(height: 10,),
                                     Container(
                                       //padding: EdgeInsets.only(left:5,top:5,),height:249,
                                       child: RichText(
                                           text: TextSpan(
                                               text: '',
                                               style: TextStyle(color: colors.whit, fontFamily: 'Poppins',
                                                   fontWeight: FontWeight.w700,fontSize: 50),
                                               children: <TextSpan>[

                                                 TextSpan(
                                                   text: '     ✓  ',
                                                   style: TextStyle(color: colors.whit,
                                                       fontFamily: 'Poppins',fontWeight: FontWeight.w500,
                                                       fontSize: 16,wordSpacing:5),
                                                 ),
                                                 TextSpan(
                                                   text: 'Ability to make stop-motion'
                                                       '\n           animation videos ',
                                                   style: TextStyle(color: colors.whit, fontFamily: 'Poppins',
                                                       fontWeight: FontWeight.w500,fontSize: 16),
                                                 ),
                                               ]

                                           )
                                       ),
                                     ),
                                     SizedBox(height: 10,),
                                     Container(
                                       //padding: EdgeInsets.only(left:5,top:5,),height:249,
                                       child: RichText(
                                           text: TextSpan(
                                               text: '',
                                               style: TextStyle(color: colors.whit, fontFamily: 'Poppins',
                                                   fontWeight: FontWeight.w700,fontSize: 50),
                                               children: <TextSpan>[

                                                 TextSpan(
                                                   text: '     ✓  ',
                                                   style: TextStyle(color: colors.whit,
                                                       fontFamily: 'Poppins',fontWeight: FontWeight.w500,
                                                       fontSize: 16,wordSpacing:5),
                                                 ),
                                                 TextSpan(
                                                   text: 'Ability to post photos/movies'
                                                       '\n           publicly online' ,
                                                   style: TextStyle(color: colors.whit, fontFamily: 'Poppins',
                                                       fontWeight: FontWeight.w500,fontSize: 16),
                                                 ),
                                               ]

                                           )
                                       ),
                                     ),


                                   ],
                                 ),
                                 SizedBox(height: 26,width: 319,
                                 ),
                                 Align(alignment:Alignment.bottomCenter ,
                                   child: InkWell(
                                     onTap: (){
                                       Navigator.push(context, MaterialPageRoute(
                                           builder: (_)=>MProfile()));
                                     },
                                     child:  Container(
                                       margin: EdgeInsets.only(left:1,top:31,right:1),
                                       decoration: BoxDecoration(
                                         shape: BoxShape.rectangle,
                                         color: HexColor('#86C33C'),
                                         borderRadius: BorderRadius.only(
                                           bottomRight: Radius.circular(25),
                                           bottomLeft: Radius.circular(25),
                                         ),
                                       ),
                                       width: 319,//MediaQuery.of(context).size.width,
                                       height:60,
                                       child: Center(
                                         child:  Text('upgrade',style:TextStyle(
                                             fontSize:16,fontWeight: FontWeight.w700,fontFamily: 'Poppins',
                                             color: HexColor ('#FFFFFF') ),),
                                       ),
                                     ),
                                   ),
                                 )
                               ],
                             ),
                           ),
                         ),
                       ),

                       // SizedBox(height:20),
                       // Container(
                       //   child: SvgPicture.asset('asset/new icons/Slider Indicator 3.svg'),
                       //
                       // ),
                     ]
                 )
               ),
             )
 */
