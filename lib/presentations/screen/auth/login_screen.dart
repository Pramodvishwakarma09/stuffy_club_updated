import 'dart:convert';
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stuffy_club/presentations/screen/auth/sign_up_screen.dart';
import '../../../utils/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/constants/Validation_Form_field.dart';
import '../../../notifaction_services/notification_service.dart';
import '../dashboard_page.dart';
import 'forget_password_screen.dart';
import 'package:http/http.dart' as http;
import '../../../utils/constants/appurls.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  NotificationServices notificationServices = NotificationServices();


  TextEditingController email_AddressC = TextEditingController();
  TextEditingController passwordC = TextEditingController();


  final _formkey = GlobalKey<FormState>();
  bool chack1 = true;
  bool loading = false;
  var deviceToken ;
  var devicType ;



  void loginwithEmail() async {
    loading = true;

    try {
      final response = await http.post(
        Uri.parse("${AppUrl.baseUrl}/login"),
        body: {
          "email": email_AddressC.value.text.trim(),
          "password": passwordC.value.text.trim(),
          "fcm_token" : "$deviceToken",
          "device_type" : "$devicType"


        },
      ).timeout(Duration(seconds: 30));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        bool login = data['success'];

        Fluttertoast.showToast(
          msg: "${data["message"]}",
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
        setState(() {
          loading = false;
        });
        if (login) {
          int user_id = data["data"][0]["id"];

          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool("isLoggedIn", true);
          prefs.setInt('user_id', user_id);
          Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoardPage()),);
          setState(() {loading = false;});
         } else {

          // Fluttertoast.showToast(msg: "${data["message"]}", toastLength: Toast.LENGTH_LONG,
          //   //duration
          //   gravity: ToastGravity.TOP,
          //   //location
          //   timeInSecForIosWeb: 1,
          //   backgroundColor: Colors.red,
          //   //background color
          //   textColor: Colors.white,
          //   //text Color
          //   fontSize: 16.0,
          //   //font size
          // );
        }
      } else {
        setState(() {
          loading = false;
        });
      }
    } catch (e) {
      setState(() {loading = false;});
      Fluttertoast.showToast(
        msg: "${e.toString()}",
        toastLength: Toast.LENGTH_LONG,
        //duration
        gravity: ToastGravity.TOP,
        //location
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        //background color
        textColor: Colors.white,
        //text Color
        fontSize: 16.0,
        //font size
      );
      print(e.toString());
    }
  }

  Future<void> devicTypeCheck()async{
    if (Platform.isAndroid) {
      var androidInfo = await DeviceInfoPlugin().androidInfo;
      var release = androidInfo.version.release;
      var sdkInt = androidInfo.version.sdkInt;
      var manufacturer = androidInfo.manufacturer;
      var model = androidInfo.model;
      print('Android $release (SDK $sdkInt), $manufacturer $model');
      devicType="0";
      // Android 9 (SDK 28), Xiaomi Redmi Note 7
    }else{
      devicType="1";

    }
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? user_id = prefs.getString('user_id');
    return user_id;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    devicTypeCheck();
    // devicTypeCheck();
    notificationServices.requestNotificationPermission();
    // notificationServices.firebaseInit(context);
    // notificationServices.setupInteractMessage(context);
    // notificationServices.isTokenRefresh();
    notificationServices.getDeviceToken().then((value){
      deviceToken=value;
      if (kDebugMode) {
        print('device token');

      }
    });

    getStringValuesSF();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(children: [
        Container(
          constraints: BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/images/Teady.png'), fit: BoxFit.cover),
          ),
        ),
        Container(constraints: BoxConstraints.expand(), color: Colors.black38),
        Container(
            constraints: BoxConstraints.expand(),
            height: 7,
            width: 10,
            child: SingleChildScrollView(
                child: Column(children: [
              SizedBox(height: 4, width: 2),
              Container(
                padding: EdgeInsets.only(top: 55, left: 40, right: 30),
                alignment: Alignment.topCenter,
                // mainAxisSize: MainAxisAlignment.center,
                child: Image.asset('asset/new icons/logo.png'),
              ),
              SizedBox(height: 31),
              Text('Hi, Welcome Back! ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Aboshi',
                      fontWeight: FontWeight.w400,
                      // color: colors.whit
                    color: colors.whit

                  )),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: Text(
                          'Sign in to your account.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              color: colors.whit),
                        )),
                    Form(
                        key: _formkey,
                        child: ListView(shrinkWrap: true, children: [
                          //  const Text("Email"),
                          SizedBox(height: 55),
                          Padding(
                            padding: const EdgeInsets.only(left: 12, right: 12),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: colors.whit.withOpacity(0.15),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 5, bottom: 5),
                                child: TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    style:
                                        TextStyle(color: colors.whit),
                                    controller: email_AddressC,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Poppins',
                                        color: colors.grey,
                                      ),
                                      hintText: 'Email Address',
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: SvgPicture.asset(
                                          'asset/new icons/envelope 1.svg',
                                          height: 12,
                                          width: 24,
                                        ),
                                      ),
                                    ),
                                    obscureText: false,
                                    validator: validateEmailField),
                              ),
                            ),
                          ),

                          SizedBox(height: 24),
                          Padding(
                            padding: const EdgeInsets.only(left: 12, right: 12),
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white.withOpacity(0.15)),
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 5, bottom: 5),
                                    child: TextFormField(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        style: TextStyle(
                                            color: colors.whit),
                                        controller: passwordC,
                                        obscureText: chack1,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Poppins',
                                              color: colors.grey),
                                          hintText: 'Password',
                                          prefixIcon: Padding(
                                            padding: EdgeInsets.all(10),
                                            child: SvgPicture.asset(
                                              'asset/new icons/lock.svg',
                                              height: 12,
                                              width: 24,
                                            ),
                                          ),
                                          suffixIcon: InkWell(
                                            onTap: () {
                                              setState(() {
                                                chack1 = !chack1;
                                              });
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.all(10),
                                              child: chack1
                                                  ? SvgPicture.asset(
                                                      'asset/new icons/Eye Slash.svg',
                                                      height: 12,
                                                      width: 24,
                                                      color: Colors.grey,
                                                    )
                                                  : SvgPicture.asset(
                                                      'asset/new icons/eye (1).svg',
                                                      height: 12,
                                                      width: 24,
                                                      color: Colors.grey,
                                                    ),
                                            ),
                                          ),
                                        ),
                                        validator: validatePassword))),
                          ),

                          SizedBox(
                            height: 13,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => Forget_Password()));
                              },
                              child: Container(
                                padding: EdgeInsets.only(right: 13),
                                width: MediaQuery.of(context).size.width,
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Forget  Password?',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Lato',
                                      color:colors.red),
                                ),
                              )),
                          SizedBox(height: 30),
                          InkWell(
                            onTap: () {
                              if (_formkey.currentState!.validate()) {
                                loginwithEmail();
                                setState(() {

                                });
                                // signin();
                              }
                            },
                            child: Container(
                              //padding: const EdgeInsets.symmetric(16),
                              margin: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color:colors.red,
                                  borderRadius: BorderRadius.circular(13)),
                              width: MediaQuery.of(context).size.width,
                              height: 56,
                              child: loading
                                  ? Center(
                                      child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ))
                                  : Center(
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Aboshi',
                                            color: colors.whit),
                                      ),
                                    ),
                            ),
                          ),
                        ]))
                  ],
                ),
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => SignUpScreen()));
                  },
                  child: Container(
                      child: Center(
                          child: RichText(
                    text: TextSpan(
                        text: 'Don’t have account?',
                        style: TextStyle(
                            color: colors.whit,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                        children: <InlineSpan>[
                          WidgetSpan(
                              alignment: PlaceholderAlignment.baseline,
                              baseline: TextBaseline.alphabetic,
                              child: SizedBox(width: 5)),
                          TextSpan(
                              text: 'Sign',
                              style: TextStyle(
                                  color:colors.red,
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  wordSpacing: 1),
                              children: <InlineSpan>[
                                WidgetSpan(
                                    alignment: PlaceholderAlignment.baseline,
                                    baseline: TextBaseline.alphabetic,
                                    child: SizedBox(width: 5)),
                                TextSpan(
                                  text: 'up',
                                  style: TextStyle(
                                      color:colors.red,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      wordSpacing: 1),
                                ),
                              ])
                        ]),
                  ))))
            ]))),
      ]),
    ));
  }
}
