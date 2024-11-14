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


class chat extends StatefulWidget {
  const chat({super.key});

  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 5),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (_,index){
                    return SizedBox(
                      width: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              child: Icon(Icons.face,size: 32,color: Colors.white,),
                            backgroundColor: Colors.white.withOpacity(0.2),
                            ),
                            Text(
                              "Prithak lamsal",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white.withOpacity(0.8)
                              ),
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                    );
                }
                ),
              ),
              SizedBox(height: 10,),
              Text(
                "Chats",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: 10,),
              Expanded(
                child: ListView.builder(
                  itemCount: 15,
                  scrollDirection: Axis.vertical,
                
                  itemBuilder: (_,index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          top: 8, left: 8, right: 8, bottom: 1),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0,right: 8,top: 12,bottom: 12),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 24,
                                child: Icon(
                                  Icons.face, size: 32, color: Colors.white,),
                                backgroundColor: Colors.white.withOpacity(0.2),
                              ),
                              SizedBox(width: 10,),
                              SizedBox(
                                width: 250,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Prithak Lamsal",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text(
                                      "Ahh hijo maile message pathako the ni tei bhayera ho k yo chai",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.7)
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Text("Tue",
                                  style: TextStyle(color: Colors.white),),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                
                  }
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
