import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class My_Spirit extends StatefulWidget {
  const My_Spirit({Key? key}) : super(key: key);

  @override
  State<My_Spirit> createState() => _My_SpiritState();
}

class _My_SpiritState extends State<My_Spirit> {

  get a => [
    'asset/images/Rectangle 1036.png',
     'asset/images/Rectangle 1036 (1).png',
     'asset/images/Rectangle 1036 (2).png',
     'asset/images/Rectangle 1036 (3).png'
  ];
  List<String> titles = [
      " Kitti",
      " Panda",
      "Doggy",
      "Bear",
  ];
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWeight = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            elevation: 1,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Text('My Sprites', style: TextStyle(fontSize: 18,
                fontFamily: 'Aboshi',
                fontWeight: FontWeight.w400,
                color: HexColor('#000000'),
                height: 2),),

            leading: IconButton(icon: Icon(Icons.arrow_back_ios,
              color: HexColor('#000000'),),
              onPressed: () {Navigator.pop(context);}
            ),
          actions: [
            InkWell(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(
                //     builder: (_)=> Condition())
                // );
              },
              child: SvgPicture.asset('asset/new icons/Shape1.svg'),
            ),
            PopupMenuButton(
                itemBuilder: (context){
                  return [
                    PopupMenuItem<int>(
                      value: 0,
                      child: Text("Privacy Policy ",style: TextStyle(
                      fontSize: 16,fontWeight: FontWeight.w400,fontFamily: 'Aboshi',
                  )
                    ),
                    ),
                    PopupMenuItem<int>(
                      value: 1,
                      child: Text("Terms & Condition",style: TextStyle(
                  fontSize: 16,fontWeight: FontWeight.w400,fontFamily: 'Aboshi',
                  )
                    ),
                    )
                  ];
                },
                onSelected:(value){
                  if(value == 0){
                    // Navigator.push(context, MaterialPageRoute(
                    //     builder: (_)=> Condition())
                    // );
                  }else if(value == 1){
                    print("Settings menu is selected.");
                  }
                }
            ),
          ],
        ),

        body: Padding(
          padding: const EdgeInsets.only(top: 15 ,bottom: 15),
          child: ListView.builder(
              itemCount:titles.length,
              itemBuilder: (BuildContext ctx, int index) {
                return Center(
                  child:
                  Container(
                    height: 155,
                    width: deviceWeight*1,
                    child: Stack(
                      children: [
                        Container(
                          // child: Card(
                          padding: EdgeInsets.only(top: 10),
                              child: Image.asset(
                                a[index], height: 155, width: deviceWeight),
                        ),
                        Positioned(
                          top: 20,
                          right: 40,
                          child: Container(
                            child: InkWell(
                                onTap: (){
                                  // Navigator.push(context, MaterialPageRoute(
                                  //     builder: (_)=> Sprite_Edit())
                                  // );
                                },
                                child: SvgPicture.asset('asset/new icons/Icon (3).svg',width:20,height:20,)),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(left:20,right:20,),
                          child: Text(titles[index], style: TextStyle(
                            fontFamily: 'Aboshi',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: HexColor('#FFFFFF'),
                          )),
                        ),
                      ],
                    ),
                  ),
                );
              }
          ),
        ),
    );
  }
}


