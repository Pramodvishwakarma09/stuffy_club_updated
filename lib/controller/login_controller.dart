// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
//
// class LoginController extends GetxController {
//   Rx<TextEditingController> emailController = TextEditingController().obs;
//   Rx<TextEditingController> passwordController = TextEditingController().obs;
//   RxBool loading = false.obs;
//   void loginWithtemail() async {
//     loading.value = true;
//     try {
//       final response = await http.post(
//         Uri.parse(AppUrl.loginApi),
//         body: {
//           'email': emailController.value.text,
//           'password': passwordController.value.text
//         },
//       ).timeout(Duration(seconds: 10));
//       var data = jsonDecode(response.body);
//       print(response.statusCode);
//       print(data);
//       bool loginnn = data['success'];
//       if (loginnn) {
//         emailController.value.clear();
//         passwordController.value.clear();
//         Get.to(() => HomeScreen());
//         loading.value = false;
//         Get.snackbar("Satus ", "Login successful",
//             backgroundColor: mycolor.primary3,
//             colorText: mycolor.whit1
//         );
//       } else {
//         loading.value = false;
//         Get.snackbar("Login Faild", "Invalid Username or Password",
//             backgroundColor: mycolor.primary3,
//             colorText: mycolor.whit1
//         );
//       }
//     } catch (e) {
//       Get.snackbar("Login Faild" , "Timeout",
//           backgroundColor: mycolor.primary3,
//           colorText: mycolor.whit1);
//
//       loading.value = false;
//       print(e.toString());
//     }
//   }
// }


import 'package:flutter/material.dart';




class HomePage3333 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    Future<bool> showExitPopup() async {
      return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Exit App'),
          content: Text('Do you want to exit an App?'),
          actions:[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
              //return false when click on "NO"
              child:Text('No'),
            ),

            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              //return true when click on "Yes"
              child:Text('Yes'),
            ),

          ],
        ),
      )??false; //if showDialouge had returned null, then return false
    }

    return WillPopScope(
        onWillPop: showExitPopup, //call function on back button press
        child:Scaffold(
            appBar: AppBar(
              title: Text("Override Back Button"),
              backgroundColor: Colors.redAccent,
            ),
            body: Center(
              child: Text("Override Back Buttton"),
            )
        )
    );
  }
}