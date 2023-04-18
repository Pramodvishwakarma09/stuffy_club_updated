import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'bottombar_screen.dart';
import 'package:async/async.dart';

class AddStuffyScreen extends StatefulWidget {
  const AddStuffyScreen({Key? key}) : super(key: key);

  @override
  State<AddStuffyScreen> createState() => _AddStuffyScreenState();
}

class _AddStuffyScreenState extends State<AddStuffyScreen> {


  final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles;

  openImages() async {
    try {
      var pickedfiles = await imgpicker.pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
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

  void uploadImage(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var stringValue = prefs.getInt('user_id');

    var request = http.MultipartRequest(
        "POST", Uri.parse("http://192.168.1.23:4000/add_Product"));
    request.fields['product_name'] = Stuffy_Name.text.toString();
    request.fields['category_id'] = "7";
    request.fields['user_id'] = stringValue.toString();
    request.fields['status'] = "public";
    request.fields['Description'] = Stuffy_Story.text.toString();
    // request.files.add(await http.MultipartFile.fromPath('file', _image!.path));

    // if (Platform.isMacOS == null) {
    //   request.fields['file'] = "";
    // } else {
    //   request.files
    //       .add(await http.MultipartFile.fromPath('file', imagefiles![1].path));
    // }
    for (var file in imagefiles!) {
      String fileName = file.path.split("/").last;
      var stream = new http.ByteStream(DelegatingStream.typed(file.openRead()));

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
          print("update user details successfully");
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
    // return Scaffold(
    //     resizeToAvoidBottomInset: false,
    //     appBar: AppBar(
    //       title: Text("Multiple Image Picker Flutter"),
    //       backgroundColor: Colors.deepPurpleAccent,
    //     ),
    //     body: Container(
    //       alignment: Alignment.center,
    //       padding: EdgeInsets.all(20),
    //       child: Column(
    //         children: [
    //
    //           //open button ----------------
    //           // ElevatedButton(
    //           //     onPressed: (){
    //           //       openImages();
    //           //     },
    //           //     child: Text("Open Images")
    //           // ),
    //
    //           Divider(),
    //           Text("Picked Files:"),
    //           Divider(),
    //           SingleChildScrollView(
    //             physics: ScrollPhysics(),
    //             scrollDirection: Axis.horizontal,
    //             child: Row(
    //               children: [
    //                 imagefiles != null?Wrap(
    //                   children: imagefiles!.map((imageone){
    //                     return Container(
    //                         child:Card(
    //                           child: Container(
    //                             height: 70, width:70,
    //                             child: Image.file(File(imageone.path)),
    //                           ),
    //                         )
    //                     );
    //                   }).toList(),
    //                 ):
    //                 Row(
    //                   children: [
    //                     Card(child: Container(  height: 70,width: 70, child:  Center(child: IconButton(onPressed: (){   openImages();}, icon: Icon(Icons.add),)),)),
    //                   ],
    //
    //                 ),
    //                 Card(child: Container(  height: 70,width: 70, child:  Center(child: IconButton(onPressed: (){   openImages();}, icon: Icon(Icons.add),)),)),
    //               ],
    //             ),
    //           ),
    //           ElevatedButton(onPressed: (){
    //             uploadImage(context);
    //           }, child: Text("upload"))
    //         ],
    //       ),
    //     )
    // );
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
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (_) => terms_condition()));
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
          SingleChildScrollView(
            physics: ScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                imagefiles != null?Wrap(
                  children: imagefiles!.map((imageone){
                    return Container(
                        child:Card(
                          child: Container(
                            height: 70, width:70,
                            child: Image.file(File(imageone.path)),
                          ),
                        )
                    );
                  }).toList(),
                ):
                Row(
                  children: [
                    Card(child: Container(  height: 70,width: 70, child:  Center(child: IconButton(onPressed: (){   openImages();}, icon: Icon(Icons.add),)),)),
                  ],

                ),
                Card(child: Container(  height: 70,width: 70, child:  Center(child: IconButton(onPressed: (){   openImages();}, icon: Icon(Icons.add),)),)),
              ],
            ),
          ),

          // Center(
          //   child: _image == null
          //       ? Container(
          //           height: 150,
          //           width: 150,
          //           child: Center(
          //             child: InkWell(
          //               onTap: () {
          //                 _imgFromCamera();
          //                 // _openCamera(context);
          //                 print('1223');
          //               },
          //               // child:Container(
          //               child: Icon(Icons.camera_alt_outlined,
          //                   color: HexColor('#FFFFFF')),
          //             ),
          //           ),
          //           decoration: const BoxDecoration(
          //             color: Colors.grey
          //           )
          //   )
          //       : Container(
          //           // padding: EdgeInsets.only(left:113,top:130,right:112,bottom:532),
          //           height: 150,
          //           width: 150,
          //           child: Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 InkWell(
          //                   onTap: () {
          //                     // _openCamera(context);
          //                     print('Gallery_Image');
          //                     _imgFromGallery();
          //                   },
          //                   child: Icon(Icons.camera_alt_outlined,
          //                       color: HexColor('#FFFFFF')),
          //                 ),
          //               ]),
          //           decoration: BoxDecoration(
          //             image: DecorationImage(
          //               fit: BoxFit.cover,
          //               image: FileImage(_image!),
          //             ),
          //           )),
          // ),
          // SizedBox(height: 25),
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
