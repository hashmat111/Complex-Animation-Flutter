
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_navigation/main.dart';

class IntroPage extends StatelessWidget{
  //here we take variable and create constructor of this class
  //and put this name=fromMain while constructor gets call it shows name form main.dart
  var namefromMain;
  IntroPage(this.namefromMain);//constructor of the class


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(

            title: Text("IntroPage"),

          ),

        body: Container(
              color: Colors.orange,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
          
          
          
                    children: [
          
                      Text("welcome, $namefromMain",style: TextStyle(color: Colors.black,fontSize: 20,),),
                      SizedBox(height: 16,),

                      ElevatedButton(onPressed: (){
                      Navigator.pop(context);//means out this page from the stack

                      }, child: Text("back"))
          
          
          
          
                     // Text("Welcome to the Inroduction Page"),
                      // ElevatedButton(onPressed: (){
                      //
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) =>  MyHomePage(title: "title"),),
                      //   );
                      //
                      //   }
                      //     , child: Text("Next"))
          
                      ],
          
          
            ),
          ),
        ),

    );
  }



}