import 'package:flutter/material.dart';
import 'package:stuffy_club/view/t_c_screen.dart';

class POPUPMENU extends StatefulWidget {
  const POPUPMENU({Key? key}) : super(key: key);

  @override
  State<POPUPMENU> createState() => _POPUPMENUState();
}

class _POPUPMENUState extends State<POPUPMENU> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  Center(
        child: PopupMenuButton(
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
                Navigator.push(context, MaterialPageRoute(
                    builder: (_)=> TCScreen())
                );
              }
            }
        ),
      ),

    );
  }
}
