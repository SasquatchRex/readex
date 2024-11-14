import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:convert';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../Authentication/login.dart';
import '../Chat/chat.dart';
import '../Profile/profile.dart';
import 'post.dart';
import 'home.dart';



class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentIndex = 0;
  bool canPop = false;
  List<Widget> body = [
    const Home(),
    const Text("Explore"),
    const Text("Add"),
    const chat(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PopScope(
        canPop: false,
        onPopInvoked: (didPop)async{
          if(_currentIndex == 0){
            await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.black,
                  title: Text("Confirm Exit",style: TextStyle(color: Colors.white.withOpacity(0.8)),),
                  content: Text("Are you sure you want to exit?",style: TextStyle(color: Colors.white.withOpacity(0.5)),),
                  actions: [
                    TextButton(
                      onPressed: () {


                        Navigator.of(context).pop(false);
                        // Return false to prevent the back navigation
                      },
                      child: Text('No',style: TextStyle(color: Colors.white.withOpacity(0.7)),),
                    ),
                    TextButton(
                      onPressed: () {

                        // Return true to allow the back navigation
                        // canPop:true;
                      },
                      child: Text('Yes',style: TextStyle(color: Colors.white.withOpacity(0.7)),),
                    ),
                  ],
                )
            );
          }
          else {
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) => const MainApp()), (
                    route) => false);
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: CupertinoColors.black,
          appBar: AppBar(
            leadingWidth: 60,
            toolbarHeight: 70,
            backgroundColor: Colors.black,
            leading: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image.asset(
                'images/reddit.png',
                scale: 25,
              ),
            ),
            title: RichText(
              text: TextSpan(
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    const WidgetSpan(
                      child: Padding(
                        padding: EdgeInsets.only(left: 0),
                      ),
                    ),
                    const TextSpan(
                        text: 'Rea', style: TextStyle(color: Colors.white)),
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
                  ]),
            ),
            actions: [
              const Icon(
                Icons.search,
                size: 26,
                color: Colors.white60,
              ),
              const SizedBox(
                width: 15,
              ),
              const Icon(
                Icons.notifications_rounded,
                size: 26,
                color: Colors.white60,
              )
            ],
          ),
          body: body[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (int newIndex) {
                setState(() {
                  _currentIndex = newIndex;
                });
              },
              backgroundColor: Colors.black,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white.withOpacity(0.5),
              type: BottomNavigationBarType.fixed,
              items: [
                const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.explore), label: "Explore"),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.social_distance_rounded), label: "Social"),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.chat_bubble), label: "Chat"),
                const BottomNavigationBarItem(icon: Icon(Icons.face), label: "Profile"),
              ]),
        ),
      ),
    );
  }
}



