import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:stuffy_club/models/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  RxBool isloading = false.obs;
  ProfileModel? getdata;
  RxList productslistcartegory = <Datumaaa>[].obs;
  // var userslist = List<Datumaaa>().obs;
  RxString name ="".obs;

  // var todoList = List<Todo>().obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    question();
  }


  question() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var stringValue = prefs.getInt('user_id');
    try {
      isloading.value = true;
      var request = http.Request(
          'POST', Uri.parse('http://192.168.1.23:4000/myprofile'));
      request.bodyFields = {'id': stringValue.toString()};

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var result = await response.stream.bytesToString();
        final finalresponse = ProfileModel.fromJson(jsonDecode(result));

        getdata = finalresponse;
        // name=ProfileModel.fromJson(jsonDecode(request.body)).data[0].fullName as RxString;
        productslistcartegory = ProfileModel.fromJson(json.decode(request.body)).data as RxList<Datumaaa>;
        // userslist.value = ProfileModel.fromJson(json.decode(request.body)).data as RxList<Datumaaa>;
        name.value=ProfileModel.fromJson(jsonDecode(request.body)).data[0]!.fullName;
       // pramod=getdata!.data as RxList<List<Datumaaa>>;

      } else {
      }
    } finally {
      isloading.value = false;
    }
  }
}