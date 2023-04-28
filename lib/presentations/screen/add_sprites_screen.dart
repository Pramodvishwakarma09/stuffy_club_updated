import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stuffy_club/presentations/screen/dashboard_page.dart';
import 'package:stuffy_club/presentations/widgets/app_bar.dart';
import '../../../utils/constants/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/constants/appurls.dart';
import 'package:async/async.dart';
import 'package:hexcolor/hexcolor.dart';

class AddSpritesScreen extends StatefulWidget {
  const AddSpritesScreen({Key? key}) : super(key: key);

  @override
  State<AddSpritesScreen> createState() => _AddSpritesScreenState();
}

class _AddSpritesScreenState extends State<AddSpritesScreen> {
  bool isLoading = false;
  var imagecount =0;
  final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles;

  openImages() async {
    try {
      var pickedfiles = await imgpicker.pickMultiImage();
      if (pickedfiles != null) {
        imagefiles = pickedfiles;

        setState(() {});
      } else {

      }
    } catch (e) {

    }
  }

  void uploadImage(context) async {
    setState(() {
      isLoading = true;
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var stringValue = prefs.getInt('user_id');

    var request = http.MultipartRequest(
        "POST", Uri.parse(AppUrl.update_sprites));
    request.fields['user_id'] = stringValue.toString();

    for (var file in imagefiles!) {
      String fileName = file.path.split("/").last;
      var stream = http.ByteStream(DelegatingStream.typed(file.openRead()));
      var length = await file.length( ); //i
      print("@@@@@@@@@@@@@@@ length @@@@@@@@@@@@@@@${length}");

      imagecount++;
      print("@@@@@@@@@@@@@@@ fileName   @@@@@@@@@@@@@@@${fileName}");
      print("@@@@@@@@@@@@@@@ count $imagecount @@@@@@@@@@@@@@@${fileName}");

      if(imagecount<5){
        var multipartFileSign = new http.MultipartFile('files', stream, length, filename: fileName);
        request.files.add(multipartFileSign);
      }else{
        Fluttertoast.showToast(
          msg: "Image lenth Max 5",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }


    }
    if(imagecount<5){

    }
    request.send().then((response) {
      http.Response.fromStream(response).then((onValue) {
        try {
          Fluttertoast.showToast(
            msg: "Add Stuffy Sucessfully",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DashBoardPage(),
              ));


        } catch (e) {
          Fluttertoast.showToast(
            msg: "Not add Stuffy Sucessfully",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          print(e.toString());
        }
      });
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#F5F5F5'),
      appBar:customAppBar("Add Sprites", context),
      body:  Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
               scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  imagefiles != null
                      ? Wrap(
                    children: imagefiles!.map((imageone) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            child: Card(
                              child: Container(
                                color:
                                HexColor('#BDBDBD').withOpacity(0.15),
                                height: 140,
                                width: 140,
                                child: Image.file(File(imageone.path)),
                              ),
                            )),
                      );
                    }).toList(),
                  )
                      : Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Card(
                            child: Container(
                              color:
                              HexColor('#BDBDBD').withOpacity(0.35),
                              height: 160,
                              width: 160,
                              child: Center(
                                  child: IconButton(
                                    onPressed: () {
                                      openImages();
                                    },
                                    icon: Icon(Icons.add),
                                  )),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
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
                  child: isLoading
                      ? CircularProgressIndicator(
                    color: Colors.white,
                  )
                      : Text(
                    'Add Stripe',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Aboshi',
                        color: colors.whit),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
