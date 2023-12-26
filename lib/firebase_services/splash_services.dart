

import 'dart:async';
import 'package:poolingapp/UI/auth/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class SplashServices {
  void isLogin(BuildContext context){
    Timer(const Duration(seconds: 3), ()=> Navigator.push(context, MaterialPageRoute(builder:(context) => LoginScreen(),)));
  }
}