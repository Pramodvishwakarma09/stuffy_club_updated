import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/appurls.dart';
import '../../../domain/models/profile_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/app_bar.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

import '../dashboard_page.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  Future<ProfileModel> loadAssets() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var stringValue = prefs.getInt('user_id');
    ProfileModel lm;
    String url = "${AppUrl.baseUrl}/myprofile";
    http.Response response =
        await http.post(Uri.parse(url), body: {"id": stringValue.toString()});
    Map<String, dynamic> jsonresponse = jsonDecode(response.body);

    lm = ProfileModel.fromJson(jsonresponse);
    fullNameC = TextEditingController(text: '${lm.data[0].fullName}');
    phoneNumberC = TextEditingController(text: '${lm.data[0].phoneNumber}');
    var _newImage = _image == null ? lm.data[0].profileImage : _image;
    return lm;
  }

  final ImagePicker _picker = ImagePicker();
  File? _image;

  TextEditingController fullNameC = TextEditingController();
  TextEditingController phoneNumberC = TextEditingController();

  var loading = false;
  void editprofile() async {
    setState(() {
      loading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var stringValue = prefs.getInt('user_id');
    var request = http.MultipartRequest("POST", Uri.parse(AppUrl.editProfile));
    request.fields['full_name'] = fullNameC.text.toString();
    request.fields['phone_number'] = phoneNumberC.text.toString();
    request.fields['user_id'] = stringValue.toString();
    request.fields['status'] = "1";
    request.fields['Membership_Plan'] = "1";
    // request.files.add(await http.MultipartFile.fromPath('file', _image!.path));

    if (_image == null) {
      request.fields['file'] = "1233";
    } else {
      request.files
          .add(await http.MultipartFile.fromPath('file', _image!.path));
    }

    request.send().then((response) {
      http.Response.fromStream(response).then((onValue) {
        try {
          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DashBoardPage(),
              ));
          // _future=Profile();

        } catch (e) {}
      });
    });
  }

  _imgFromGallery() async {
    final XFile? image = (await _picker.pickImage(
        source: ImageSource.gallery, imageQuality: 85));
    if (image != null) {
      setState(() {
        _image = File(image.path);
        testCompressFile(_image!);
      });
    }
  }

  _imgFromCamera() async {
    final XFile? photo =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 85);
    if (photo != null) {
      setState(() {
        _image = File(photo.path);
        testCompressFile(_image!);
      });
    }
  }

  Future<Uint8List> testCompressFile(File file) async {
    var result = await FlutterImageCompress.compressWithFile(
      file.absolute.path,
      minWidth: 2300,
      minHeight: 1500,
      quality: 94,
      rotate: 90,
    );

    print(file.lengthSync());
    print(result!.length);
    return result;
  }

  @override
  void initState() {
    loadAssets();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar("Edit Profile",context,),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child:FutureBuilder(
            future: loadAssets(),
            builder: (context, AsyncSnapshot<ProfileModel> snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15,),
                      Center(child: _image==null? Container(
                        height: 150,
                        width: 150,
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      ListTile(
                                        leading: new Icon(Icons.photo),
                                        title: new Text('Photo'),
                                        onTap: () {
                                          _imgFromGallery();
                                          Navigator.pop(context);
                                        },
                                      ),
                                      ListTile(
                                        leading: new Icon(Icons.camera_alt_outlined),
                                        title: new Text('Camera'),
                                        onTap: () {
                                          _imgFromCamera();
                                          Navigator.pop(context);
                                        },
                                      ),

                                    ],
                                  );
                                });
                          },
                          // child:Container(
                          child: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.black
                          ),
                        ),
                        decoration:BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("${snapshot.data!.data[0].profileImage}"),
                            ),
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(150)
                        ),
                      ): Container(
                        // padding: EdgeInsets.only(left:113,top:130,right:112,bottom:532),
                          height: 150,
                          width: 150,
                          child:
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: (){
                                    // _openCamera(context);

                                    _imgFromGallery();
                                    // _showDialog(context);
                                  },

                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                  ),
                                ),
                              ]
                          ),

                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              //colorFilter: ColorFilter.matrix(1),
                              image: FileImage(_image!),
                            ),
                          )
                      ), ),

                      SizedBox(height: 21,),
                      Center(
                        child: Text(
                          '${snapshot.data!.data[0].fullName}',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Aboshi',
                            fontWeight: FontWeight.w400,
                            color: colors.black1,
                          ),
                        ),
                      ),
                      // Obx(() =>  Center(
                      //   child: profileController.isloading.value ? Center(child: CircularProgressIndicator()): Text(
                      //     '${profileController.getdata!.data[0].fullName}',
                      //     style: TextStyle(
                      //       fontSize: 18,
                      //       fontFamily: 'Aboshi',
                      //       fontWeight: FontWeight.w400,
                      //       color: colors.black1,
                      //     ),
                      //   ),
                      // ),),
                      SizedBox(height: 5,),
                      Center(child: Text("${snapshot.data!.data[0].email}")),
                      SizedBox(height: 43,),
                      Text(
                        'Full Name',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Aboshi',
                          fontWeight: FontWeight.w400,
                          color: colors.black1,
                        ),
                      ),
                      SizedBox(height: 5,),


                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          controller: fullNameC,
                          decoration: InputDecoration(
                            hintText: "Full Name",
                            contentPadding: EdgeInsets.fromLTRB(15,5,0,0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),


                      SizedBox(
                        height: 10,),
                      Text('Phone Number',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Aboshi',
                          fontWeight: FontWeight.w400,
                          color: colors.black1,
                        ),
                      ),
                      SizedBox(height: 5,),
                      TextFormField(
                        maxLength: 12,

                        keyboardType: TextInputType.number,
                        controller: phoneNumberC,
                        decoration: InputDecoration(
                          counter: Container(),
                          hintText: "Phone Number",
                          contentPadding: EdgeInsets.fromLTRB(15,5,0,0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,),

                      InkWell(
                        onTap: () {
                          editprofile();
                        },
                        child: Container(
                          //padding: const EdgeInsets.symmetric(16),
                          margin: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color:Color(0xff86C33C),
                              borderRadius: BorderRadius.circular(13)),
                          width: MediaQuery.of(context).size.width,
                          height: 56,
                          child: loading? Center(child: CircularProgressIndicator(color: Colors.white,))
                              :
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Update',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Aboshi',
                                      color: colors.whit),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                );

              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),

        ));
  }
}
