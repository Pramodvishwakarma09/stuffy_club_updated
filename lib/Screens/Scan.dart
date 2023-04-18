
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../view/home_screen.dart';
import '../view/bottombar_screen.dart';

class QRCreat extends StatefulWidget {
  const QRCreat({Key? key}) : super(key: key);

  @override
  State<QRCreat> createState() => _QRCreatState();
}
class _QRCreatState extends State<QRCreat> {
  final qrkey = GlobalKey(debugLabel: 'QR');

  final controller = TextEditingController();

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) =>

      Scaffold(
          backgroundColor: HexColor('#000000'),
            appBar: AppBar(
            backgroundColor: HexColor('#000000'),
            actions: [
                InkWell(
                onTap: (){
      Navigator.push(context, MaterialPageRoute(
      builder: (_)=> BottomBar_Screen())
      );
      },
                 child: SvgPicture.asset('asset/new icons/Path (1).svg')),
            ],
          ),
          body: Center(
            child: Container(
              padding: EdgeInsets.only(bottom:100,),
              child: Image.asset('asset/images/Group 1557 (1).png'),
            ),
          ),

      );
  buildTextField (BuildContext context)=>
      Container(
        alignment: Alignment.bottomCenter,
    //height: 40,
    margin: EdgeInsets.all(45),

    decoration: BoxDecoration(color:HexColor('#FFFFFF1A').withOpacity(0.12),
        borderRadius: BorderRadius.circular(12)
    ),
       padding:  EdgeInsets.only(left:1,right:2,top:1),
        child:TextField(
        controller: controller,
        style: TextStyle(
          color: HexColor('#FFFFFF'),
          fontWeight: FontWeight.w400, fontSize: 15,),
        decoration: InputDecoration(
          hintText: ' the QR to view stuffy',
          hintStyle: TextStyle(color:HexColor('#FFFFFF1A')),
          enabledBorder: OutlineInputBorder(),
        )
    ),
  );
}



/*
      Scaffold(
          backgroundColor: HexColor('#000000'),
          appBar: AppBar(
            backgroundColor: HexColor('#000000'),
            actions: [
              Container(
                alignment:Alignment.bottomRight,
                child: SvgPicture.asset('asset/new icons/Path (1).svg'),
              )
            ],
          ),
      body: Center(child: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
// Container(
//   child: Image.asset('asset/images/qr-code-scan 1.png'),
// ),
                  QrImage(data :controller.text,
                    foregroundColor: HexColor('#FFFFFF'),
                    padding: EdgeInsets.only(left:59,right:59 ,top:59, bottom:59 ),
                    size:250,
                    backgroundColor: HexColor('#000000'),
                  ),
                  SizedBox(height:65,),
            buildTextField(context),
               ],
        ),
      ),
    )
  );

  buildTextField (BuildContext context)=> Container(
    //height: 40,
       margin: EdgeInsets.all(45),

  decoration: BoxDecoration(color:HexColor('#FFFFFF1A').withOpacity(0.12),
            borderRadius: BorderRadius.circular(12)
  ),
        padding:  EdgeInsets.only(left:1,right:2,top:1),
        child:TextField(
      controller: controller,
        style: TextStyle(
          color: HexColor('#FFFFFF'),
              fontWeight: FontWeight.w400, fontSize: 15,),
       decoration: InputDecoration(
         hintText: 'Scan the QR to view stuffy',
         hintStyle: TextStyle(color:HexColor('#FFFFFF')),
         enabledBorder: OutlineInputBorder(),
       )
       ),
  );
}



 */

// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   String _scanBarcode = 'Unknown';
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   Future<void> startBarcodeScanStream() async {
//     FlutterBarcodeScanner.getBarcodeStreamReceiver(
//         '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
//         .listen((barcode) => print(barcode));
//   }
//
//   Future<void> scanQR() async {
//     String barcodeScanRes;
//     try {
//       barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//           '#ff6666', 'Cancel', true, ScanMode.QR);
//       print(barcodeScanRes);
//     } on PlatformException {
//       barcodeScanRes = 'Failed to get platform version.';
//     }
// //barcode scanner flutter ant
//     setState(() {
//       _scanBarcode = barcodeScanRes;
//     });
//   }
//
//   Future<void> scanBarcodeNormal() async {
//     String barcodeScanRes;
//     try {
//       barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//           '#ff6666', 'Cancel', true, ScanMode.BARCODE);
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
// //barcode scanner flutter ant
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//             appBar: AppBar(title: const Text('Barcode Scanner')),
//             body: Builder(builder: (BuildContext context) {
//               return Container(
//                   alignment: Alignment.center,
//                   child: Flex(
//                       direction: Axis.vertical,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         ElevatedButton(
//                             onPressed: () => scanBarcodeNormal(),
//                             child: const Text('Barcode scan')),
//                         ElevatedButton(
//                             onPressed: () => scanQR(),
//                             child: const Text('QR scan')),
//                         ElevatedButton(
//                             onPressed: () => startBarcodeScanStream(),
//                             child: const Text('Barcode scan stream')),
//                         Text('Scan result : $_scanBarcode\n',
//                             style: const TextStyle(fontSize: 20))
//                       ]));
//             })));
//   }
// }

//barcode scanner flutter ant


//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:stuffy_club/Onboarding2.dart';
// import 'package:onboarding/onboarding.dart';
//  import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
//
//
// class Scan extends StatefulWidget {
//   const Scan({Key? key}) : super(key: key);
//
//   @override
//   State<Scan> createState() => _ScanState();
// }
// class _ScanState extends State<Scan> {
//   String _scanBarcode = 'Unknown';
//  @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//   Future<void> startBarcodeScanStream() async {
//     FlutterBarcodeScanner.getBarcodeStreamReceiver(
//         '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
//         .listen((barcode) => print(barcode));
//   }
//   Future<void> scanQR() async {
//     String barcodeScanRes;
//     try {
//       barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//           '#ff6666', 'Cancel', true, ScanMode.QR);
//       print(barcodeScanRes);
//     } on PlatformException {
//       barcodeScanRes = 'Failed to get platform version.';
//     }
// //barcode scanner flutter ant
//     setState(() {
//       _scanBarcode = barcodeScanRes;
//     });
//   }
//
//   Future<void> scanBarcodeNormal() async {
//     String barcodeScanRes;
//     try {
//       barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//           '#ff6666', 'Cancel', true, ScanMode.BARCODE);
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
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Builder(builder: (BuildContext context) {
//           return Container(
//               alignment: Alignment.center,
//               child: Flex(
//                   direction: Axis.vertical,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     //child:SvgPicture.asset('asset/new icons/send_circle.svg'),
//                     //const Text('Barcode scan')
//                   ]
//               )
//
//
//           );
//         }
//     )
//     );
//
// }
// }






