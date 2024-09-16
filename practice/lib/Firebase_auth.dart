import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice/HomePage.dart';
import 'package:practice/Sign.dart';
import 'package:practice/main.dart';

createUserWithEmailAndPassword(String emailAddress,String password,BuildContext context)async{

  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    User ? user=credential.user;
    if(user!=null)
      {

        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn(),));

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User registered successfuly !"),
        backgroundColor: Colors.green,
        ));

      }else{}


  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {

//snack bar to show the msgs to the user i added
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("The password provided is too weak !"),
        backgroundColor: Colors.red,
      ));

      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("The account already exists for that emai !"),
        backgroundColor: Colors.red,
      ));
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }

}
signInWithEmailAndPassword(String emailAddress,String password,BuildContext context)async{

  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password
    );
    User ? user=credential.user;
    if(user!=null){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(),));
      
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Successfuly !"),
        backgroundColor: Colors.green,
      ));



    }
    else{}
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {


      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No user found for that email !"),
        backgroundColor: Colors.red,
      ));




      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {

      //i added this shows the message in the bottome of the screen
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong password provided for that user !"),
        backgroundColor: Colors.red,
      ));


      print('Wrong password provided for that user.');
    }
  }
}