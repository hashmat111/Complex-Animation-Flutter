import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_store_local_data/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("LoginPage",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_circle,size: 100,),
            SizedBox(height: 20,),
            TextField(controller: TextEditingController(),style: TextStyle(fontSize: 20,color: Colors.blueGrey),

              decoration: InputDecoration( border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),labelText: "Name",hintText: "Enter Your Name",prefixIcon: Icon(Icons.person)),

            ),
            SizedBox(height: 21,),
            TextField(controller: TextEditingController(),style: TextStyle(fontSize: 20,color: Colors.blueGrey),
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),labelText: "Email",hintText: "Enter Your Email!",prefixIcon: Icon(Icons.email),),

//logic
            ),
            SizedBox(height: 21,),
            ElevatedButton(onPressed: () async {
              //if successfully login (credentials are correct)
              var sharedpref=await SharedPreferences.getInstance();
              sharedpref.setBool(SplashScreenState.KEYLOGIN, true);

              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: ""),));



            }, style: designElevateButton(), // we separate designed the button in fun so we can use it multiple tiime rathe then writing the code again for desing

            child: Text("Login",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),))


          ],
        ),
      ),
      





    );

  }


//ButtonStyle returns the correct button style we use it not the void
  ButtonStyle designElevateButton() {
    return ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      backgroundColor: Colors.blueGrey, // Button color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 5,
    );
  }

}
