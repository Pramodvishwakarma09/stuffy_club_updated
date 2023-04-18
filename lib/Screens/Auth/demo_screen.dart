import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body: Center(
        child: TextButton(
          onPressed: () async {
            SharedPreferences pref =await SharedPreferences.getInstance();
            pref.setString("email", "useremail@gmail.com");
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
              return Home();
            }));
          },
          child: const Text("Login",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        ),
      ),
    );
  }
}



class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
      body: Center(
        child: TextButton(
          onPressed: () async {
            SharedPreferences pref = await SharedPreferences.getInstance();
            pref.remove("email");
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
              return Login();
            }));
          },
          child: Text("Logout",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        ),
      ),
    );
  }
}