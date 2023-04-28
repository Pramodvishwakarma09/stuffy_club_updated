import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../utils/constants/appurls.dart';

class LoginProvider extends ChangeNotifier{
   bool _obsText =true;
   bool get obsText => _obsText ;


   setObsText(bool value){
     _obsText = value ;
     notifyListeners() ;
   }

  bool _loading = false ;
  bool get loading => _loading ;

  setLoading(bool value){
    _loading = value ;
    notifyListeners() ;
  }

  void login(String email , password) async {

    setLoading(true);
    try{

      Response response = await post(
          Uri.parse(AppUrl.loginUser),
          body: {
            'email' : email,
            'password' : password,
            "fcm_token" : "3434",
            "device_type" : "0"
          }
      );

      if(response.statusCode == 200){
        setLoading(false);
        var data = jsonDecode(response.body);
        bool login = data['success'];
        print(data["message"]);

        if (login) {
          print('Login successfully');


        }else{

          print(data["message"]);
          print("loginFaild");
        }



      }else {
        setLoading(false);

        print('failed');
      }
    }catch(e){
      setLoading(false);
      print('failed');
      print(e.toString());
      print('failed');
    }
  }

















}