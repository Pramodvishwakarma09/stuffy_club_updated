import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../utils/constants/appurls.dart';
import '../../domain/models/t_c_model.dart';

class TCScreen extends StatelessWidget {
  TCScreen({Key? key}) : super(key: key);

  Future<TcModel> loadAssets2() async {
    TcModel lm;
    String url = AppUrl.termsandcondition;
    http.Response response =
        await http.post(Uri.parse(url), body: {'category_id': "1"});
    Map<String, dynamic> jsonresponse = jsonDecode(response.body);
    lm = TcModel.fromJson(jsonresponse);
    return lm;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
          child: FutureBuilder(
        future: loadAssets2(),
        builder: (context, AsyncSnapshot<TcModel> snapshot) {
          if (snapshot.hasData) {
            return Html(
              data: """${snapshot.data!.terms.toString()}""",
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      )
          ),
    ));
  }
}
