import 'package:easygoexam/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign up"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                Icons.account_circle,
                size: 100,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: TextEditingController(),
                style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: "Name",
                    hintText: "Enter Your Name",
                    prefixIcon: Icon(Icons.person)),
              ),
              SizedBox(
                height: 21,
              ),
              TextField(
                controller: TextEditingController(),
                style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: "Email",
                  hintText: "Enter Your Email!",
                  prefixIcon: Icon(Icons.email),
                ),

//logic
              ),
              SizedBox(
                height: 21,
              ),
              ElevatedButton(
                  onPressed: () async {
                    //if successfully login (credentials are correct)
                    // var sharedpref=await SharedPreferences.getInstance();
                    //        sharedpref.setBool(SplashScreenState.KEYLOGIN, true);

                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login(),));
                  },
                  style: Login().designElevateButton(), // we separate designed the button in the login class we call it here
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ))
            ])));
  }
}
