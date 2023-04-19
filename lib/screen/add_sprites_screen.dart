import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../const.dart';
import 'bottombar_screen.dart';
import 'package:async/async.dart';

class AddSpritesScreen extends StatefulWidget {
  const AddSpritesScreen({Key? key}) : super(key: key);

  @override
  State<AddSpritesScreen> createState() => _AddSpritesScreenState();
}

class _AddSpritesScreenState extends State<AddSpritesScreen> {



  bool isLoading =false;

  final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles;

  openImages() async {
    try {
      var pickedfiles = await imgpicker.pickMultiImage();
      if(pickedfiles != null){
        imagefiles = pickedfiles;
        setState(() {
        });
      }else{
        print("No image is selected.");
      }
    }catch (e) {
      print("error while picking file.");
    }
  }
  // File? _image;
  // PickedFile ? _pickedFile;
  // final _picker=ImagePicker();
  // Future<void>_pickImage()async{
  //   _pickedFile=await _picker.getImage(source: ImageSource.gallery);
  //   if(_pickedFile != null){
  //     setState(() {
  //       _image=File(_pickedFile!.path);
  //     });
  //     bool succes=false;
  //
  //     // http.StreamedRequest response= await uploadImage(_pickedFile);
  //
  //   }
  // }

  final TextEditingController Stuffy_Name = TextEditingController();
  final TextEditingController Stuffy_Slug = TextEditingController();
  final TextEditingController Public = TextEditingController();
  final TextEditingController Stuffy_Story = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  void uploadImage(context) async {
    setState(() {
      isLoading =true;
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var stringValue = prefs.getInt('user_id');

    var request = http.MultipartRequest(
        "POST", Uri.parse("${AppUrl.baseUrl}/update_sprites"));
    request.fields['user_id'] = stringValue.toString();

    for (var file in imagefiles!) {
      String fileName = file.path.split("/").last;
      var stream = http.ByteStream(DelegatingStream.typed(file.openRead()));

      // get file length

      var length = await file.length(); //imageFile is your image file

      // multipart that takes file
      var multipartFileSign = new http.MultipartFile('files', stream, length, filename: fileName);

      request.files.add(multipartFileSign);
    }
    print("??????????????${request.fields.toString()}");
    request.send().then((response) {
      http.Response.fromStream(response).then((onValue) {
        try {
          Navigator.pop(context);
          print(onValue.body);
          Fluttertoast.showToast(
            msg: "Add Stuffy Sucessfully",
            toastLength: Toast.LENGTH_LONG,
            //duration
            gravity: ToastGravity.BOTTOM,
            //location
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            //background color
            textColor: Colors.white,
            //text Color
            fontSize: 16.0,
            //font size
          );
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BottomBar_Screen(),
              ));
          // _future=Profile();

        } catch (e) {

        }
      });
    });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#F5F5F5'),
      appBar: AppBar(
          centerTitle: true,
          elevation: 1,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            'Add Sprites',
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'Aboshi',
                fontWeight: FontWeight.w400,
                color: HexColor('#000000'),
                height: 2),
          ),
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
      body: SingleChildScrollView(
        child: ListView(shrinkWrap: true, children: [
          Form(
            key: _formkey,
            child: Column(
            children: [
              SizedBox(height: 10,),
              SingleChildScrollView(
                physics: ScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(

                  children: [
                    imagefiles != null?Wrap(
                      children: imagefiles!.map((imageone){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              child:Card(
                                child: Container(
                                  color: HexColor('#BDBDBD').withOpacity(0.15),
                                  height: 140, width:140,
                                  child: Image.file(File(imageone.path)),
                                ),
                              )
                          ),
                        );
                      }).toList(),
                    ):
                    Padding(
                      padding: const EdgeInsets.symmetric( horizontal: 20.0),
                      child: Row(
                        children: [
                          Card(child: Container(
                            color: HexColor('#BDBDBD').withOpacity(0.35),
                            height: 160,width: 160, child:  Center(child: IconButton(onPressed: (){   openImages();}, icon: Icon(Icons.add),)),)),
                        ],

                      ),
                    ),
                    // Card(child: Container(
                    //   color: HexColor('#BDBDBD').withOpacity(0.35),
                    //   height: 100,width: 100, child:  Center(child: IconButton(onPressed: (){   openImages();}, icon: Icon(Icons.add),)),)
                    // ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(12),
                child: InkWell(
                  onTap: () {
                    uploadImage(context);

                  },
                  child: Container(
                    margin: EdgeInsets.all(13),
                    decoration: BoxDecoration(
                        color: HexColor('#03A9D6'),
                        borderRadius: BorderRadius.circular(13)),
                    width: MediaQuery.of(context).size.width,
                    height: 56,
                    child: Center(
                      child: isLoading ? CircularProgressIndicator(  color: Colors.white,) :  Text(
                        'Add Stripe',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Aboshi',
                            color: HexColor('#FFFFFF')),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          ),
        ]),
      ),
    );
  }
}
