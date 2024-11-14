

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
import '../Authentication/login.dart';
import '../Chat/chat.dart';
import '../Profile/profile.dart';
import 'homemain.dart';






class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: CupertinoColors.black,
        appBar: AppBar(
          leadingWidth: 60,
          toolbarHeight: 70,
          backgroundColor: Colors.black,
          leading: GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const MainApp()),
                    (route) => false,
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image.asset(
                'images/reddit.png',
                scale: 25,
              ),
            ),
          ),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "u/sasquatch_rex",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              Text(
                "r/Napal",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
        ),
        body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding:
                  const EdgeInsets.only(top: 0, bottom: 8, left: 8, right: 8),
                  child: Text(
                    "Problem of instagram sending OTP from private number",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.85), fontSize: 20),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: const Padding(
                        padding: EdgeInsets.only(
                            top: 6, bottom: 6, left: 8, right: 8),
                        child: Text(
                          "29th May, 2024",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    Container(
                      child: const Padding(
                        padding: EdgeInsets.only(
                            top: 4, bottom: 4, left: 8, right: 8),
                        child: Text(
                          "NSFW",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                              left: 12.0, right: 12, top: 12, bottom: 12),
                          child: Text(
                            "So 12 diyera baseko. I like to code. Mah Aile Web dev. Ma Frontend almost sakera backend Baki xa. Now, further study ko Lagi bachelors ma k garnu. ani malai dherai le Nepal ma na bas vanxan. Aba abroad study ke gari garne kehi thaha xaina. Need a genuine advice. Thanks in advance.",
                            style: TextStyle(color: Colors.white60, fontSize: 14),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10.0, top: 4, bottom: 4),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.thumb_up_alt_outlined,
                                        color: Colors.white70,
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        "22.5k",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white12.withOpacity(0.05)),
                              ),
                              Container(
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10.0, top: 4, bottom: 4),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.thumb_down_alt_outlined,
                                        color: Colors.white70,
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        "1.2k",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white12.withOpacity(0.05)),
                              ),
                              Container(
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10.0, top: 4, bottom: 4),
                                  child: Row(
                                    children: [
                                      // Text("27.8k",style: TextStyle(color: Colors.white,fontSize: 15),),
                                      Icon(
                                        Icons.share_rounded,
                                        color: Colors.white70,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Share",
                                        style: TextStyle(
                                            color: Colors.white70, fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white12.withOpacity(0.05)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    maxLines: 1,
                    cursorHeight: 24,
                    decoration: InputDecoration(
                        hintText: "Add a comment ...",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.white.withOpacity(0.4))
                      // border: InputBorder(borderSide: BorderSide.none),

                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10)),
                  // height: 120,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 12.0),
                          child: Icon(
                            Icons.face_4,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "u/sasquatch_rex",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                  fontSize: 10),
                            ),
                            Container(
                              width: 330,
                              child: Text(
                                "whattt in the actualll ffff🤣🤣 i did computer engineering… i scored 7.5 in ielts… i have no skill… my sister is in abroad… i am also thinking the same if its worth spending such huge sum… i also did a job for about 6 months but remember nth.. glad to know i am not the only one stuck in this crisis ..legit us bro moment",
                                style:
                                TextStyle(color: Colors.white.withOpacity(0.8)),
                                softWrap: true,
                                // maxLines: 10,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: const Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, right: 10.0, top: 4, bottom: 4),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.thumb_up_alt_outlined,
                                            color: Colors.white70,
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            "22.5k",
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 15),
                                          )
                                        ],
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white12.withOpacity(0.05)),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    child: const Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, right: 10.0, top: 4, bottom: 4),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.thumb_down_alt_outlined,
                                            color: Colors.white70,
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            "1.2k",
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 15),
                                          )
                                        ],
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white12.withOpacity(0.05)),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    child: const Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, right: 10.0, top: 4, bottom: 4),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.reply,
                                            color: Colors.white70,
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            "Reply",
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 15),
                                          )
                                        ],
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white12.withOpacity(0.05)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}