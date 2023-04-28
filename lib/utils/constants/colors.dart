import 'package:flutter/material.dart';


extension colors on ColorScheme {
  static MaterialColor primary_app = const MaterialColor(
    0xff86C33C,
    const <int, Color>{
      50: primary,
      100: primary,
      200: primary,
      300: primary,
      400: primary,
      500: primary,
      600: primary,
      700: primary,
      800: primary,
      900: primary,
    },
  );

  static const Color primary = Color(0xff86C33C);
  static const Color primarydark = Color(0xff00CA14);

  static const Color whit = Color(0xffffffff);
  static const Color grey = Color(0xffA2A0A8);
  static const Color note2 = Color(0xffBDBDBD);
  static const Color red=  Color(0xffED1D22);
  static const Color red2 = Color(0xffd9595c);
  static const Color black1 = Color(0xff000000);

  static const Color black2 =  Color(0xff333333);
  
  


  static const Color green = Color(0xff27a44b);
  static const Color textFieldClr = Color(0xfff1f1f1);

  Color get btnColor =>
      this.brightness == Brightness.dark ? whiteTemp : primary;
  Color get secColor =>
      this.brightness == Brightness.dark ?  const Color(0xffD9F6CF) :const  Color(0xff2F6248);

  Color get lightWhite => this.brightness == Brightness.dark ? darkColor : const Color(0xffffffff);

  Color get fontColor =>
      this.brightness == Brightness.dark ? whiteTemp : const Color(0xff222222);

  Color get fontClr =>
      this.brightness == Brightness.dark ? whiteTemp : const Color(0xff8e8e8e);

  Color get gray =>
      this.brightness == Brightness.dark ? colors.whit : const Color(0xffe1e1e1);

  Color get simmerBase =>
      this.brightness == Brightness.dark ? darkColor2 : Colors.grey[200]!;

  Color get simmerHigh =>
      this.brightness == Brightness.dark ? darkColor : const Color(0xffF8F8F8);

  static Color darkIcon = Color(0xff9B9B9B);



  Color get lightBlack =>
      this.brightness == Brightness.dark ? whiteTemp : const Color(0xff52575C);

  Color get lightBlack2 =>
      this.brightness == Brightness.dark ? white70 : const Color(0xff999999);

  static const Color darkColor = Color(0xff17242B);
  static const Color darkColor2 = Color(0xff29414E);
  static const Color darkColor3 = Color(0xff22343C);

  Color get white =>
      this.brightness == Brightness.dark ? darkColor2 : const Color(0xffFFFFFF);
  static const Color whiteTemp = Color(0xffFFFFFF);

  Color get black =>
      this.brightness == Brightness.dark ? whiteTemp : const Color(0xff000000);

  static const Color white10 = Colors.white10;
  static const Color white30 = Colors.white30;
  static const Color white70 = Colors.white70;

  static const Color black54 = Colors.black54;
  static const Color black12 = Colors.black12;
  static const Color disableColor = Color(0xffEEF2F9);

  static const Color blackTemp = Color(0xff000000);

  Color get black26 =>
      this.brightness == Brightness.dark ? white30 : Colors.black26;
  static const Color cardColor = Color(0xffFFFFFF);

  Color get back1 => this.brightness == Brightness.dark
      ? Color(0xff1E3039)
      : Color(0x66a2d8fe);

  Color get back2 => this.brightness == Brightness.dark
      ? Color(0xff09202C)
      : Color(0x66bdb1ff);

  Color get back3 => this.brightness == Brightness.dark
      ? Color(0xff10101E)
      : Color(0x66EFAFBF);

  Color get back4 => this.brightness == Brightness.dark
      ? Color(0xff171515)
      : Color(0x66F9DED7);

  Color get back5 => this.brightness == Brightness.dark
      ? Color(0xff0F1412)
      : Color(0x66C6F8E5);
}


