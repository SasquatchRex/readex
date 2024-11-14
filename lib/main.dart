import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:convert';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

// import 'app_state.dart';

import 'Authentication/login.dart';
import 'Chat/chat.dart';
import 'Profile/profile.dart';
import 'Home/homemain.dart';
// import 'signup.dart';

String baseurl = "http://192.168.1.6:8000/";



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? token = await TokenManager.getToken();
  print("Token is $token");
  Widget initialScreen;
  if (token != null && await isAuthenticated(token)) {
    initialScreen = const MainApp();
  } else {
    initialScreen = const LoginView();
  }
  runApp(
      // ChangeNotifierProvider(
      //   create: (context) => AppState(),
      //   child: LoginView(),
      // ),
      MaterialApp(
    title: "Page",
    home: initialScreen,
  ));
}

