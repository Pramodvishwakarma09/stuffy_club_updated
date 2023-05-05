import 'package:flutter/material.dart';

class QrCodeScren extends StatelessWidget {
   var  imagename ;
   QrCodeScren({Key? key , required this.imagename}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Center(
        child: Container(
            width: 300,
            height: 300,
            child: Image(
              width: 70,
              image: NetworkImage(
                "${imagename}",
              ),
              fit: BoxFit.fill,
            )
        ),
      ),
    );
  }
}
