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

import '../main.dart';
import 'login.dart';

// String base_url = "http://192.168.1.4:8000/";


class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> signup(String username, String password) async {
    final String url = baseurl + 'signup/';

    // Replace this data with your request payload
    Map<String, dynamic> postData = {
      'username': username,
      'password': password,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(postData),
        headers: {
          'Content-Type': 'application/json',
          // Add any additional headers if needed
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginView()),
              (route) => false,
        );
      } else {
        // Handle an error response
      }
    } catch (error) {
      // Handle any network or other errors
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var appState = Provider.of<AppState>(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Register",
            style: TextStyle(
              fontSize: 26,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
          leading: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginView()),
                          (route) => false,
                    );
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
        body: Container(
          color: Colors.black,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 40, bottom: 10),
                  child: Image.asset('images/reddit.png',scale: 15,).animate()
                      .then(delay: 600.ms)
                      .fade(duration: const Duration(milliseconds: 1000)),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 1, bottom: 20),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        const TextSpan(text: 'Rea'),
                        TextSpan(
                          text: 'dex',
                          style: TextStyle(
                            foreground: Paint()
                              ..shader = const LinearGradient(
                                colors: [Colors.redAccent, Colors.redAccent],
                              ).createShader(
                                  const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                    .animate()
                    .then(delay: 800.ms)
                    .fade(duration: const Duration(milliseconds: 1200)),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  width: 350,
                  child: TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        labelStyle: const TextStyle(color: Colors.white60),
                      ),
                      style: const TextStyle(color: Colors.white)),
                ).animate().fade(duration: const Duration(milliseconds: 1500)),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  width: 350,
                  child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white60),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        labelStyle: const TextStyle(color: Colors.white60),
                      ),
                      obscureText: true,
                      style: const TextStyle(color: Colors.white)),
                ).animate().fade(duration: const Duration(milliseconds: 1500)),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.of(context).pushNamedAndRemoveUntil(
                      //   '/home/',
                      //   (route) => false,
                      // );
                      String username = usernameController.text;
                      String password = passwordController.text;
                      signup(username, password);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.greenAccent),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ).animate().fade(duration: const Duration(milliseconds: 1500)),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your button press logic here
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.deepPurpleAccent)),
                    child: const Text('Sign Up with Google',
                        style: TextStyle(color: Colors.black, fontSize: 16)),
                  ),
                ).animate().fade(duration: const Duration(milliseconds: 1500)),
              ],
            ),
          ),
        ),
      ).animate().fade(duration: const Duration(milliseconds: 1000)),
    );
  }
}