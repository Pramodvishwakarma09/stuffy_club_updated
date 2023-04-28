import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../utils/constants/colors.dart';
import '../providers/dashborad_controller.dart';
import 'my_sprites.dart';
import 'auth/profile_screen.dart';
import 'test.dart';
import 'home_screen.dart';
import 'my_stuffy_screen.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class DashBoardPage extends StatefulWidget {
  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  DashBoardPageController landingPageController2 = Get.put(DashBoardPageController());
  var _scanBarcode ;
  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      debugPrint(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
      var ok = jsonDecode(_scanBarcode);

      var  product_id = ok["product_id"];
      Navigator.push(context, MaterialPageRoute(builder: (context) => TestPage(product_id2: "${product_id}"),));
    });
  }

  final TextStyle unselectedLabelStyle =
  TextStyle(color: Colors.white.withOpacity(0.5), fontWeight: FontWeight.w500, fontSize: 12);
  final TextStyle selectedLabelStyle =
  TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => SizedBox(
      height: 75,
      child: BottomNavigationBar(
        // showUnselectedLabels: true,
        // showSelectedLabels: true,
        onTap: landingPageController.changeTabIndex,
        // currentIndex: landingPageController.tabIndex.value,
        // backgroundColor: colors.primary,
        // type: BottomNavigationBarType.fixed,
        // unselectedItemColor: Colors.red.withOpacity(0.5),
        // selectedItemColor: Colors.white,
        // unselectedLabelStyle: unselectedLabelStyle,
        // selectedLabelStyle: selectedLabelStyle,
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Container(
                  child:  SvgPicture.asset('asset/new icons/tab1.svg'),
                    // SvgPicture.asset('asset/new icons/tab1.svg')
                ),
                landingPageController2.tabIndex ==0 ? Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: SizedBox(
                    width: 30,
                      child: Divider(color: Colors.white, thickness: 2,)),
                ):Container()
              ],
            ),
            label: '',
            backgroundColor: colors.primary,
          ),
          BottomNavigationBarItem(
            icon: Center(
              child: Column(
                children: [
                  Container(
                    child:  SvgPicture.asset('asset/new icons/tab2.svg'),
                  ),
                  landingPageController2.tabIndex ==1 ? Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: SizedBox(
                        width: 30,
                        child: Divider(color: Colors.white, thickness: 2,)),
                  ):Container()
                ],
              ),
            ),
            label: '',

            backgroundColor: colors.primary,
          ),


          BottomNavigationBarItem(
            icon:  InkWell(
                onTap: (){
                  scanQR();
                },
                child: SvgPicture.asset('asset/new icons/tab3.svg',color: colors.whit)),
            label: '',
            backgroundColor: colors.primary,
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Container(
                  child:   SvgPicture.asset('asset/new icons/tab4.svg'),
                ),
                landingPageController2.tabIndex ==3 ? Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: SizedBox(
                      width: 30,
                      child: Divider(color: Colors.white, thickness: 2,)),
                ):Container()
              ],
            ),
            label: '',
            backgroundColor: colors.primary,
          ), BottomNavigationBarItem(
            icon: Column(
              children: [
                Container(
                  child:  SvgPicture.asset('asset/new icons/tab5.svg'),
                ),
                landingPageController2.tabIndex ==4 ? Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: SizedBox(
                      width: 30,
                      child: Divider(color: Colors.white, thickness: 2,)),
                ):Container()
              ],
            ),
            label: '',
            backgroundColor: colors.primary,
          ),
        ],
      ),
    ));
  }

  Future<bool> showExitPopup() async {
    return  await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Exit App'),
        content: Text('Do you want to exit an App?'),
        actions:[
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            //return false when click on "NO"
            child:Text('No'),
          ),

          ElevatedButton(
            onPressed: () => SystemNavigator.pop(),
            //return true when click on "Yes"
            child:Text('Yes'),
          ),

        ],
      ),
    )??false; //if showDialouge had returned null, then return false
  }
  void  check() {

    if(landingPageController2.tabIndex != 0 ){
      landingPageController2.tabIndex = 0 as RxInt;

    }else{
      showExitPopup();
    }

  }

  Future<bool> _willPopCallback() async {

    if(landingPageController2.tabIndex == 0 ){

      showExitPopup();
    }else{
      setState((){
        landingPageController2.tabIndex.value = 0;
      });
    }

    return false; // return true if the route to be popped
  }
  @override
  Widget build(BuildContext context) {
    final DashBoardPageController landingPageController = Get.put(DashBoardPageController(),
        permanent: false);
    return WillPopScope(
      onWillPop: _willPopCallback, //ca
      child: Scaffold(
        bottomNavigationBar:
        buildBottomNavigationMenu(context, landingPageController),
        body: Obx(() => IndexedStack(
          index: landingPageController.tabIndex.value,
          children: [
            HomeScreen(),
            MyStuffyScreen(),
            Container(),
            My_Spirit(),
            ProfileScreen(),
          ],
        )),
      ),
    );
  }
}