import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../utils/constants/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/app_bar.dart';
import 'package:async/async.dart';
import '../../utils/constants/appurls.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dashboard_page.dart';

class EditSpritesScreen extends StatefulWidget {
   var  productId;
  final String name;
  final String satus;
  final String Description;
  String images;
  List x;
  String? imangNAME;
  EditSpritesScreen({
    Key? key,
    this.imangNAME,
    required this.satus,
    required this.x,
    required this.name,
    required this.Description,
    required this.images,
    required this.productId,
    //
  }) : super(key: key);

  @override
  State<EditSpritesScreen> createState() => _EditSpritesScreenState();
}

class _EditSpritesScreenState extends State<EditSpritesScreen> {
  bool isLoading = false;

  final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles;

  openImages() async {
    try {
      var pickedfiles = await imgpicker.pickMultiImage();
      if (pickedfiles != null) {
        imagefiles = pickedfiles;
        setState(() {});
      } else {}
    } catch (e) {}
  }
  Future loadAssets() async {
    Stuffy_Name = TextEditingController(text: '${widget.name}');
    Stuffy_Slug = TextEditingController(text: '${widget.name}');
    Public = TextEditingController(text: '${widget.name}');
    Stuffy_Story = TextEditingController(text: '${widget.Description}');
  }

   TextEditingController Stuffy_Name = TextEditingController();
   TextEditingController Stuffy_Slug = TextEditingController();
   TextEditingController Public = TextEditingController();
   TextEditingController Stuffy_Story = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  void uploadImage(context) async {
    setState(() {
      isLoading = true;
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var stringValue = prefs.getInt('user_id');

    var request = http.MultipartRequest(
        "POST", Uri.parse(AppUrl.edit_product));
    request.fields['product_name'] = Stuffy_Name.text.toString();
    request.fields['Description'] = Stuffy_Story.text.toString();
    request.fields['user_id'] = stringValue.toString();
    request.fields['status'] = "$dropdownValue";
    request.fields['product_id'] = "${widget.productId}";

    for (var file in imagefiles!) {
      String fileName = file.path.split("/").last;
      var stream = http.ByteStream(DelegatingStream.typed(file.openRead()));

      var length = await file.length(); //imageFile is your image file

      // multipart that takes file
      var multipartFileSign =
      new http.MultipartFile('files', stream, length, filename: fileName);

      request.files.add(multipartFileSign);
    }

    request.send().then((response) {
      http.Response.fromStream(response).then((onValue) {
        try {
          Navigator.pop(context);

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
        } catch (e) {}
      });
    });
  }


  var items = [
    'Public',
    'Private',
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAssets();
  }

  String? dropdownValue = "Public";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#F5F5F5'),
      appBar: customAppBar("Add Stuffy", context),
      body: ListView(shrinkWrap: true, children: [
        Form(
          key: _formkey,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(12),
                color: HexColor('#F5F5F5'),
                child: TextFormField(
                  textAlign: TextAlign.start,
                  controller: Stuffy_Name,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                      color: colors.black1),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: HexColor('#BDBDBD').withOpacity(0.15),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                        width: 0.5,
                        color: HexColor('#BDBDBD'),
                      ),
                    ),
                    hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                        color: HexColor('#BDBDBD')),
                    hintText: " Stuffy Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Stuffy Name";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(12),
                color: HexColor('#F5F5F5'),
                child: TextFormField(
                  controller: Stuffy_Slug,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                    color: colors.black1,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: HexColor('#BDBDBD').withOpacity(0.15),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                        width: 0.5,
                        color: HexColor('#BDBDBD'),
                      ),
                    ),
                    hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                        color: HexColor('#BDBDBD')),
                    hintText: " Stuffy Slug",
                    // fillColor:Colors.transparent,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide.none),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Stuffy Slug";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 1),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: HexColor('#BDBDBD').withOpacity(0.15),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0xffBDBDBD))),
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child:
                    // dropdownValue != null ?
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: colors.primary,
                          ),
                          elevation: 16,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          underline: Container(
                            color: Colors.black54,
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                          items: items
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    )),
              ),
              SizedBox(height: 1),
              Container(
                margin: EdgeInsets.all(12),
                color: HexColor('#F5F5F5'),
                child: TextFormField(
                  maxLines: 10,
                  minLines: 5,
                  textAlign: TextAlign.start,
                  controller: Stuffy_Story,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                      color: colors.black1),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: HexColor('#BDBDBD').withOpacity(0.15),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                        width: 0.5,
                        color: HexColor('#BDBDBD'),
                      ),
                    ),
                    hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                        color: HexColor('#BDBDBD')),
                    hintText: " Stuffy Story",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide:
                        BorderSide.none), //  fillColor: Colors.grey[300],
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Stuffy Story";
                    }
                    return null;
                  },
                ),
              ),
              SingleChildScrollView(
                physics: ScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    imagefiles != null
                        ? Wrap(
                      children: imagefiles!.map((imageone) {
                        return Container(
                            child: Card(
                              child: Container(
                                color: HexColor('#BDBDBD').withOpacity(0.15),
                                height: 70,
                                width: 70,
                                child: Image.file(File(imageone.path)),
                              ),
                            ));
                      }).toList(),
                    )
                        : Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Card(
                              child: Container(
                                color: HexColor('#BDBDBD').withOpacity(0.35),
                                height: 70,
                                width: 70,
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
                    Card(
                        child: Container(
                          color: HexColor('#BDBDBD').withOpacity(0.35),
                          height: 70,
                          width: 70,
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
              Container(
                margin: EdgeInsets.all(12),
                child: InkWell(
                  onTap: () {
                    if (_formkey.currentState!.validate()) {
                      if (imagefiles == null) {
                        Fluttertoast.showToast(
                          msg: "Image is Requried",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: colors.primary,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      } else {
                        uploadImage(context);
                      }
                    }
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
                        'Add Stuffy',
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
        ),
      ]),
    );
  }
}
