import 'package:flutter/material.dart';

class AppColor{

  static Map<int, Color> color =
  {
    50:Color.fromRGBO(31,71,78,.1),
    100:Color.fromRGBO(31,71,78,.2),
    200:Color.fromRGBO(31,71,78,.3),
    300:Color.fromRGBO(31,71,78,.4),
    400:Color.fromRGBO(31,71,78,.5),
    500:Color.fromRGBO(31,71,78,.6),
    600:Color.fromRGBO(31,71,78,.7),
    700:Color.fromRGBO(31,71,78,.8),
    800:Color.fromRGBO(31,71,78,.9),
    900:Color.fromRGBO(31,71,78,1),
  };

  static MaterialColor colorCustom = MaterialColor(0xff1F474E, color);
  static const Color darkGreen = Color(0xff1F474E) ;
  static const Color lightGreen = Color(0xff2F6B75) ;
}