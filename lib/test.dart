import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
     String name;
   Demo({Key? key, required this.name}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
       Future loadAssets() async {nameC = TextEditingController(text: '${widget.name}');}
       TextEditingController nameC =TextEditingController();
       final _formkey = GlobalKey<FormState>();
       @override
          void initState() {
        // TODO: implement initState
         super.initState();
          loadAssets();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          SizedBox(height: 300,),
          Center(
            child:Form(
              key: _formkey,
              child: TextFormField(
                controller: nameC,
              ),
            ),

          ),
          Text(widget.name),

          ElevatedButton(onPressed: (){
            print(nameC.text);
          }, child: Text("sumbit"))

        ],
      ),
    );
  }
}
