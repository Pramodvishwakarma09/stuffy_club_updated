import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:stuffy_club/models/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/home_model.dart';
import '../models/search_model.dart';

class HomeController extends GetxController {

  RxBool isloading = false.obs;
  HomeModel? getdata;
  RxList productslistcartegory = <Category>[].obs;
  TextEditingController search = TextEditingController();


  @override
  Future<void> onInit() async {
    super.onInit();
    question();
    print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
    getdata;
  }

   question() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var stringValue = prefs.getInt('user_id');
    try {
      isloading.value = true;
      var request = http.Request(
          'POST', Uri.parse('http://192.168.1.23:4000/homePage'));
      request.bodyFields = {'search':  search.text.toString() };

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var result = await response.stream.bytesToString();
        print(result.toString());
        final finalresponse = HomeModel.fromJson(jsonDecode(result));

        print(finalresponse.toString());

        getdata = finalresponse;
        productslistcartegory = HomeModel.fromJson(json.decode(request.body)).categories as RxList<Category>;
       // newest_stuffy =getdata!.newestStuffy.cast<Category>();
       //  print(newest_stuffy.length);
        print("EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE");

        update();
       print("asdfghjkl${getdata!.newestStuffy.toString()}");
       return finalresponse;

      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
    } finally {
      isloading.value = false;
    }
  }

}