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
import '../Home/home.dart';
import '../Home/post.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.1),
                      radius: 40,
                      child: const Icon(
                        Icons.face,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: "u/",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.5), fontSize: 12),
                      ),
                      TextSpan(
                        text: "Sasquatch_rex",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 16,
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
              const SizedBox(
                width: 5,
              ),
              Column(
                children: [
                  Container(
                    width: 240,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "0.6k",
                              style:
                              TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Text(
                              "Post Reads",
                              style:
                              TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                        // SizedBox(width: 5,),
                        Column(
                          children: [
                            Text(
                              "12k",
                              style:
                              TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Text(
                              "Comment Reads",
                              style:
                              TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                        // SizedBox(width: 5,),
                        Column(
                          children: [
                            Text(
                              "12k",
                              style:
                              TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Text(
                              "Followers",
                              style:
                              TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).viewInsets.bottom,
                                ),

                                child: SingleChildScrollView(
                                  child: Container(
                                    color: Colors.black.withOpacity(0.95),
                                    width: 400,
                                    height: 300,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 16.0,right: 8),
                                      child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                        // crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Align(
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                style: ButtonStyle(

                                                  // alignment: Alignment.topRight,
                                                    backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Colors.red.shade900)),
                                                child: const Icon(
                                                  Icons.close,
                                                  color: Colors.white,
                                                )),
                                            alignment: Alignment.topRight,
                                          ),

                                          ElevatedButton(
                                            onPressed: () {},
                                            child:  CircleAvatar(
                                              child: Icon(Icons.face,size: 50,),
                                              radius: 50,
                                              backgroundColor: Colors.white.withOpacity(0.1),
                                            ),
                                            style: const ButtonStyle(
                                                padding: MaterialStatePropertyAll(
                                                    EdgeInsets.all(0))),
                                          ),
                                          const SizedBox(height: 10,),
                                          Text(
                                            "Change Profile Avatar",
                                            style: TextStyle(
                                                color: Colors.white.withOpacity(0.5),
                                                fontSize: 16
                                            ),

                                          ),
                                          const SizedBox(height: 20,),
                                          SizedBox(

                                            child: Row(
                                              children: [
                                                const Text(
                                                  "Display Name",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18
                                                  ),),
                                                const SizedBox(width: 10,),
                                                Container(
                                                  width:200,
                                                  height:30,// This allows the TextField to take up the remaining space
                                                  child: TextField(
                                                    style: TextStyle(
                                                      color: Colors.white.withOpacity(0.8),
                                                    ),
                                                    decoration: InputDecoration(
                                                      // Hint style color
                                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)), // Add a border to the text field
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                      },
                      style: const ButtonStyle(
                          backgroundColor:
                          MaterialStatePropertyAll(Colors.blueAccent),
                          shape: MaterialStatePropertyAll(
                              ContinuousRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10))))),
                      child: const Text(
                        "Edit Profile",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 10,),
        Expanded(
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.newspaper,size: 20,),text: "Community",height: 50),
                    Tab(icon: Icon(Icons.comment,size: 20,),text: "Social",),
                  ],
                  labelColor: Colors.white.withOpacity(0.7),
                  unselectedLabelColor: Colors.white.withOpacity(0.4),
                  indicatorColor: Colors.white.withOpacity(0.7),
                ),
                SizedBox(height: 10,),
                // Expanded to take up remaining space
                Expanded(
                  child: TabBarView(
                    children: [
                      Tab1View(),
                      Tab2View(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }
}

class Tab1View extends StatelessWidget {
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
                          color: Colors.white.withOpacity(0.1),
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

class Tab2View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Content of Tab 2'),
    );
  }
}


class editprofile extends StatefulWidget {
  const editprofile({super.key});

  @override
  State<editprofile> createState() => _editprofileState();
}

class _editprofileState extends State<editprofile> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Text("Hello"),
      ),
    );
  }
}