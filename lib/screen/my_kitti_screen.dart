import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../models/my_sprites_model.dart';

class MyKittiScreen extends StatefulWidget {
  List imageList ;
  MyKittiScreen({Key? key,required this.imageList}) : super(key: key);

  @override
  State<MyKittiScreen> createState() => _MyKittiScreenState();
}

class _MyKittiScreenState extends State<MyKittiScreen> {


  @override
  Widget build(BuildContext context) {
    print("@@@@@@@@@@@@@@@wer${widget.imageList[0]}");
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text('Images', style: TextStyle(fontSize: 18,
            fontFamily: 'Aboshi',
            fontWeight: FontWeight.w400,
            color: HexColor('#000000'),
            height: 2),),

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
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0,top: 20),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: widget.imageList.length,
          itemBuilder: (context, index) {
          return Padding(
            padding:  EdgeInsets.fromLTRB(0,10,20,10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("${widget.imageList[index].imageNames}"),
                  )
              ),
              height: 100,width: 100,

            ),
          );
        },),
      )
    );
  }
}
