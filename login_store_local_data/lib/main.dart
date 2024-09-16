import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_store_local_data/LoginPage.dart';
import 'package:login_store_local_data/SplashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:login_store_local_data/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,// making the Debug banner in the corner remove
      home:  SplashScreen(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();


}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(

        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          color: Colors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
                  children: [Center(child: Icon(Icons.home,color: Colors.white,size: 100,)), Text("Home Page",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                  SizedBox(height: 20,),//distance between text icon and button
                    ElevatedButton(onPressed: ()async{
                      Navigator.pushReplacement(context, MaterialPageRoute (builder:(context)=>LoginPage(),));
                      var sharedpref=await SharedPreferences.getInstance();
                      sharedpref.setBool(SplashScreenState.KEYLOGIN, false);//it logouts when click on the button in homepage

                    },style: LoginPage().designElevateButton(), child: Text("Logout"))//we use designElevateButton to copy the design we did in the loginPage as fun we use it here
          ],

                ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
    ));
  }


}

//we can create the splsh screen here as well rather then creating another page



class SplashScreen extends StatefulWidget{
  State<SplashScreen> createState() => SplashScreenState();
}

//if you put _Splash then it becomes private will not be accessbile SO REMOVE _ FROM Splash screen state
@override
class SplashScreenState extends State<SplashScreen> {
  static const String KEYLOGIN="login";

  @override
  void initState() {
    super.initState();


    WhereToGo();


  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue,
        child: Icon(
          Icons.account_circle,
          color: Colors.blueGrey,
          size: 100.0, // You can adjust the size as needed
        ),

      ),

    );

  }
//functions
void WhereToGo()async {

    var sharedPref=await SharedPreferences.getInstance();
    var islogin=sharedPref.getBool(KEYLOGIN);

  Timer(Duration(seconds: 2),() {
//if true then Splash and enter MyhomepPage.
    if(islogin!=null){
      if(islogin){
        Navigator.pushReplacement(context, MaterialPageRoute (builder:(context)=>MyHomePage(title: ""),));// already login so it goes to home page after splash

      }   else{

        Navigator.pushReplacement(context, MaterialPageRoute (builder:(context)=>LoginPage(),));//when you logout and again want to login flash and go to login page not home page directly because you  logout before
      }

    }    else{

      Navigator.pushReplacement(context, MaterialPageRoute (builder:(context)=>LoginPage(),));//if first time runnign the application this wil excute after splash
    }



  });
}}


                      //Explanation
// this project is bassically when user meets or login the application we dont need to give the user
//hare time when they visit again the application it should be login already rather then going to login page again
//it goes directly to home page because the user with the same device visited before and we store it in local database

//for this project we made one splashscreen inside the main file that obeviously we can if we want ,
//the next screen is login and basic login
// of course we have the main scrren we have not design it properly but in the  moment will do that ! excited