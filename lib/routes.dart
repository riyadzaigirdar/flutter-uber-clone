import 'package:flutter/material.dart';
import 'package:uber/screens/login/login.dart';
import 'package:uber/screens/register/register.dart';

const LoginRoute = "/login";
const RegisterRoute = "/register";

RouteFactory routes() {
    return (settings) {
      print(settings);
    // var arguments =  settings.arguments;
    // final Map<String, dynamic> arguments = settings.arguments;
    Widget screen;
    switch (settings.name) {
      case LoginRoute:
        screen = Login();
        break;
      case RegisterRoute:
        screen = Register();
        break;
      default:
        return null;
    }
    return MaterialPageRoute(builder: (BuildContext context) => screen);
  };
}