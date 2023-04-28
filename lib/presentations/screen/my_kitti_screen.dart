import 'package:flutter/material.dart';
import 'package:stuffy_club/presentations/widgets/app_bar.dart';

class MyKittiScreen extends StatefulWidget {
  List imageList ;
  MyKittiScreen({Key? key,required this.imageList}) : super(key: key);

  @override
  State<MyKittiScreen> createState() => _MyKittiScreenState();
}

class _MyKittiScreenState extends State<MyKittiScreen> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppBar("Images", context),
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
                border: Border.all(color: Colors.black.withOpacity(0.5)),
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
