import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:stuffy_club/models/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/t_c_model.dart';

class TCController extends GetxController {
  RxBool isloading = false.obs;
  TcModel? getdata;

  @override
  Future<void> onInit() async {
    super.onInit();
    question();
  }


  question() async {
    print("@@@@@@@@@@@@@@@@@@@@@@@@@______tc");

    try {
      isloading.value = true;
      var request = http.Request(
          'POST', Uri.parse('http://192.168.1.23:4000/termsandcondition'));
      request.bodyFields = {'category_id': "1"};

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print("@@@@@@@@@@@@@@@@@@@@@@@@@______tc2");
        var result = await response.stream.bytesToString();
        print(result.toString());
        final finalresponse = TcModel.fromJson(jsonDecode(result));
        print("@@@@@@@@@@@@@@@@@@@@@@@@@______tc3");


        getdata = finalresponse;
        print(getdata!.terms[0].toString());
        isloading.value=false;

      } else {
        print("@@@@@@@@@@@@@@@@@@@@@@@@@______tc4");
        isloading.value=false;

        print(response.reasonPhrase);
      }
    } catch (e) {
      print("@@@@@@@@@@@@@@@@@@@@@@@@@______tc5");
      isloading.value=false;

    } finally {
      isloading.value = false;
      print("@@@@@@@@@@@@@@@@@@@@@@@@@______tc6");

    }
  }
}