import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ndialog/ndialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../common function/basurl.dart';
import '../models/add_stuffy_model.dart';
import '../view/t_c_screen.dart';

class AS1 extends StatefulWidget {
  const AS1({Key? key}) : super(key: key);

  @override
  State<AS1> createState() => _AS1State();
}

class _AS1State extends State<AS1> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController Stuffy_Name = TextEditingController();
  final TextEditingController Stuffy_Slug = TextEditingController();
  final TextEditingController Public = TextEditingController();
  final TextEditingController Stuffy_Story = TextEditingController();

  final ImagePicker imgpicker = ImagePicker();
  Future? _future;
  ProgressDialog? progressDialog;
  var success, message, data;
  var tokanget, username;
  var user_id;

  List<XFile>? imagefiles;

  openImages() async {
    try {
      var pickedfiles = await imgpicker.pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
      if (pickedfiles != null) {
        imagefiles = pickedfiles;
        setState(() {});
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

  Future<Add_stuffy_model> Addstuffydata() async {
    print('????????????????????111111111111111');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      tokanget = prefs.getString('login_tokan');
      tokanget = tokanget!.replaceAll('"', '');
      user_id = prefs.getString('user_id');
      user_id = user_id!.replaceAll('"', '');
    });
    check().then((intenet) {
      if (intenet != null && intenet) {
        progressDialog = ProgressDialog(context, dismissable: false);
        progressDialog?.setMessage(Text("Loading...."));
        //   progressDialog?.show();
      } else {
        Fluttertoast.showToast(
            msg: "Please check your Internet connection!!!!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: HexColor('#ED1D22'),
            textColor: Colors.white,
            fontSize: 16.0);
      }
    });
    Map toMap() {
      var map = Map<String, dynamic>();
      map["search"] = "";
      return map;
    }

    print(toMap().toString());
    var response = await http.post(
      Uri.parse(beasurl1 + "addProduct"),
      body: toMap(),
    );

    progressDialog!.dismiss();
    print(
        'addProduct${Add_stuffy_model.fromJson(json.decode(response.body)).success}');
    success = (Add_stuffy_model.fromJson(json.decode(response.body)).success);
    message = (Add_stuffy_model.fromJson(json.decode(response.body)).message);
    progressDialog!.dismiss();
    if (success == true) {
      progressDialog!.dismiss();
    } else {
      progressDialog!.dismiss();
      print('else==============');
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: HexColor('#F5F5F5'),
          textColor: Colors.black,
          fontSize: 16.0);
    }
    return Add_stuffy_model.fromJson(json.decode(response.body));
  }

  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    _future = Addstuffydata();
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
            'Add Stuffy',
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
          actions: [
            InkWell(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(
                //     builder: (_)=> POPUPMENU())
                // );
              },
              child: SvgPicture.asset('asset/new icons/Shape1.svg'),
            ),
            PopupMenuButton(itemBuilder: (context) {
              return [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text("Privacy Policy ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Aboshi',
                      )),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Text("Terms & Condition",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Aboshi',
                      )),
                )
              ];
            }, onSelected: (value) {
              if (value == 0) {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (_) => Condition()));
              } else if (value == 1) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => TCScreen()));
              }
            }),
          ]),
      body: SingleChildScrollView(
        child: ListView(shrinkWrap: true, children: [
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
                  color: HexColor('#000000')),
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
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
                color: HexColor('#000000'),
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
          Container(
            margin: EdgeInsets.all(12),
            color: HexColor('#F5F5F5'),
            child: TextFormField(
              controller: Public,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                  color: HexColor('#000000')),
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
                hintText: " Public",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide.none),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Public";
                }
                return null;
              },
            ),
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
                  color: HexColor('#000000')),
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
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 15),
            child: Row(
              children: [
                GBox(),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: G1Box(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: G2Box(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: G3Box(),
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
          Container(
            margin: EdgeInsets.all(12),
            child: InkWell(
              onTap: () {
                // Navigator.push(
                    // context, MaterialPageRoute(builder: (_) => StufHome()));
              },
              child: Container(
                margin: EdgeInsets.all(13),
                decoration: BoxDecoration(
                    color: HexColor('#03A9D6'),
                    borderRadius: BorderRadius.circular(13)),
                width: MediaQuery.of(context).size.width,
                height: 56,
                child: Center(
                  child: Text(
                    'Add Stuffy',
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
        ]),
      ),
    );
  }
}

class GBox extends StatefulWidget {
  const GBox({Key? key}) : super(key: key);

  @override
  State<GBox> createState() => _GBoxState();
}

class _GBoxState extends State<GBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70.0,
        width: 70.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                width: 2, color: HexColor('#BDBDBD').withOpacity(0.15)),
            color: HexColor('#BDBDBD').withOpacity(0.14)),
        child: new Center(
            child: Image.asset(
          'asset/images/dark_grey_img.png',
          width: 20,
          height: 20,
          fit: BoxFit.fill,
        )));
  }
}

class G1Box extends StatefulWidget {
  const G1Box({Key? key}) : super(key: key);

  @override
  State<G1Box> createState() => _G1BoxState();
}

class _G1BoxState extends State<G1Box> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 20.0,
        width: 20.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                width: 2, color: HexColor('#BDBDBD').withOpacity(0.15)),
            color: HexColor('#BDBDBD').withOpacity(0.14)),
        child: new Center(
            child: Image.asset(
          'asset/images/dark_grey_img.png',
          width: 20,
          height: 20,
          fit: BoxFit.fill,
        )));
  }
}

class G2Box extends StatefulWidget {
  const G2Box({Key? key}) : super(key: key);

  @override
  State<G2Box> createState() => _G2BoxState();
}

class _G2BoxState extends State<G2Box> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70.0,
        width: 70.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                width: 2, color: HexColor('#BDBDBD').withOpacity(0.15)),
            color: HexColor('#BDBDBD').withOpacity(0.14)),
        child: new Center(
            child: Image.asset(
          'asset/images/dark_grey_img.png',
          width: 20,
          height: 20,
          fit: BoxFit.fill,
        )));
  }
}

class G3Box extends StatefulWidget {
  const G3Box({Key? key}) : super(key: key);

  @override
  State<G3Box> createState() => _G3BoxState();
}

class _G3BoxState extends State<G3Box> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70.0,
        width: 70.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                width: 2, color: HexColor('#BDBDBD').withOpacity(0.15)),
            color: HexColor('#BDBDBD').withOpacity(0.14)),
        child: new Center(
            child: SvgPicture.asset(
          'asset/new icons/Path (2).svg',
          width: 20,
          height: 20,
          fit: BoxFit.fill,
        )));
  }
}
