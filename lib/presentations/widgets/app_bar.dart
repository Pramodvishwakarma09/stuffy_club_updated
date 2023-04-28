import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';

AppBar customAppBar(title, context,){
  return AppBar(
    elevation: 1,
    backgroundColor: colors.whit,
    title: Text(title!,
      style: const  TextStyle(
          fontSize: 18,
          fontFamily: 'Aboshi',
          fontWeight: FontWeight.w400,
          color: colors.black1,
          height: 2),),
    centerTitle: true,
    leading: IconButton(
      onPressed: (){
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back_ios, color: colors.black1,),

    ),
  );
}


