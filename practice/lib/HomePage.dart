import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Home Page"),),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Welcome to Home Page",style: TextStyle(fontSize: 40,color: Colors.black),),
        ],
      )




    );

  }


}