


import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_navigation/IntroPage.dart';
import 'package:page_navigation/main.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();


}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {

  Timer(Duration(seconds: 2),(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>MyHomePage(title: "",)));


  });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
          //here we dont give AppBar because its splash scrren we dont need the bar
      body:Container(

        color: Colors.blue,
                child:   Center(child: Text("SPLASH 2 seconds",style: TextStyle(fontSize: 20,color: Colors.white),)) ,

     ),

      ) ;

  }
}