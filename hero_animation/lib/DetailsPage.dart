import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar( title: Text("DetailPage"), ),


      body:

           Container(

              child: Hero(tag: 'background', child: Image.asset('assest/images/cat2.jpg',))

                      ),



    );
  }



}