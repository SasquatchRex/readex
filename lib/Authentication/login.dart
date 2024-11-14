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
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'signup.dart';
import '../Home/homemain.dart';



late String tokenget;

class TokenManager {
  static const String _tokenKey = 'auth_token';

  static Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  static Future<void> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }
}

Future<bool> isAuthenticated(String Token) async {
  print("Authentication token is $Token");
  final response = await http.get(Uri.parse(baseurl + "checklogin"), headers: {
    'Content-Type': 'application/json',
    'Authorization': "Token $Token",
    // Add any additional headers if needed
  });
  print(response.body);
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    print(data);
    return true;
  } else {
    return false;
  }
}


class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late Map<String, dynamic> loginResponse = {"hehe":"hehe"};
  late int login_status=0;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login(String username, String password) async {
    loginResponse.remove("hehe");
    setState(() {
      login_status=0;
    });

    final String url = baseurl+'login/';

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
      setState(() {
        loginResponse = jsonDecode(response.body);

        login_status = response.statusCode;
      });

      // print(loginResponse);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        // Handle a successful response
        tokenget = jsonResponse['token'];
        await TokenManager.saveToken(jsonResponse['token']);
        loginResponse = jsonResponse;
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MainApp()),
              (route) => false,
        );
      } else {

        // Handle an error response
      }
    } catch (error) {
      print(error);
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
        appBar: null,
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
                                ).createShader(const Rect.fromLTWH(
                                    0.0, 0.0, 200.0, 70.0)),
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
                            borderSide:
                            const BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.greenAccent),
                          ),
                          labelStyle:
                          const TextStyle(color: Colors.white60),
                        ),
                        style: const TextStyle(color: Colors.white)),
                  )
                      .animate()
                      .fade(duration: const Duration(milliseconds: 1500)),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    width: 350,
                    child: TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.white60),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          labelStyle:
                          const TextStyle(color: Colors.white60),
                        ),
                        obscureText: true,
                        style: const TextStyle(color: Colors.white)),
                  )
                      .animate()
                      .fade(duration: const Duration(milliseconds: 1500)),

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
                        setState(() {
                          loginResponse = {};
                        });

                        String username = usernameController.text;
                        String password = passwordController.text;
                        login(username, password);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.greenAccent),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                      .animate()
                      .fade(duration: const Duration(milliseconds: 1500)),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    width: 300,
                    height: 50,
                    child: ElevatedButton(

                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const MainApp()),
                              (route) => false,
                        );
                        // Add your button press logic here
                      },
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(
                              Colors.deepPurpleAccent)),
                      child: const Text('Sign In with Google',
                          style: TextStyle(
                              color: Colors.black, fontSize: 16)),
                    ),
                  )
                      .animate()
                      .fade(duration: const Duration(milliseconds: 1500)),
                  Center(
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const SignUpView()),
                                  (route) => false,
                            );
                            // Add your button press logic here
                          },
                          child: const Text(
                            "Don't Already have an account?",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white54,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                  )
                      .animate()
                      .fade(duration: const Duration(milliseconds: 1500)),
                  Container(
                      child: (loginResponse.isEmpty && login_status!=0)
                      // ? Icon(Icons.cancel,color: Colors.redAccent,)
                          ? CircularProgressIndicator()
                          : (login_status == 401)
                          ?Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.dangerous,color: Colors.redAccent,),
                          SizedBox(width: 10,),
                          Text("No such user !",style: TextStyle(color: Colors.white.withOpacity(0.8),fontSize: 18),)
                        ],
                      )
                          :(login_status ==200)
                          ?Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.verified,color: Colors.greenAccent,),
                          Text("Sucesfully Logged in",style: TextStyle(color: Colors.white.withOpacity(0.8),fontSize: 18),)

                        ],
                      )
                          :Icon(Icons.dangerous,color: Colors.greenAccent,)
                  ),
                ],
              ),
            )),
      ).animate().fade(duration: const Duration(milliseconds: 1000)),
    );
  }
}