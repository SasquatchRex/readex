
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
import 'post.dart';







class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.001),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 10, right: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.vertical,
                itemBuilder: (_,index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const PostView()),
                              (route) => false,
                        );
                        // Add your button press logic here
                      },
                      child: Container(
                        height: 210,
                        // width: ,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.075),
                          // border: Border.all(color: Colors.white.withOpacity(0.1))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 12, bottom: 4, left: 16, right: 8),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "r/napal",
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.99),
                                        fontSize: 11),
                                  ),
                                  Text(
                                    "19th May, 2024",
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.6),
                                        fontSize: 11),
                                  ),
                                ],
                              ),
                              Text(
                                "Problem of instagram sending OTP from private number",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize: 20,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "So 12 diyera baseko. I like to code. Mah Aile Web dev. Ma Frontend almost sakera backend Baki xa. Now, further study ko Lagi bachelors ma k garnu. ani malai dherai le Nepal ma na bas vanxan. Aba abroad study ke gari garne kehi thaha xaina. Need a genuine advice. Thanks in advance.",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                  fontSize: 13,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 5,
                                softWrap: true,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
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
                                          Text(
                                            "27.8k",
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 15),
                                          ),
                                          // Icon(Icons.thumb_up_alt_outlined,color: Colors.white70,),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Discussions",
                                            style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 15),
                                          )
                                        ],
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white12.withOpacity(0.05)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
