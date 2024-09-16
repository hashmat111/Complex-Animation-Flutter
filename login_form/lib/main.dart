import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  var _EmailText=TextEditingController();
  var _PasswordText=TextEditingController();


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
               // child:Text("login")

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                Text(
                  "Login Lawre", // Text at the top
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Color(0xFF0000FF)),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 50), // Adds vertical space
                TextField(
                  controller: _EmailText,
                  keyboardType: TextInputType.emailAddress,//you can give phone as well
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter Email',
                    prefixIcon: Icon(Icons.email),//we can use phone as well for phone
                    border: OutlineInputBorder(),

                    suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye),
                      onPressed: (){},//you can call the fun whatever ope ration you want to done
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF808080),width: 2),),

                      enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF0000FF),width: 2),),

                    errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFF0000),),

                  ),

                ),

                ),
                  
                  SizedBox(height: 16,),//adds vertical space


                TextField(
                  controller: _PasswordText,
                  obscureText: true,//hide the passowrd
                  obscuringCharacter: '*',//this is used for password hide how to show*****
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter Password',
                   // prefixIcon: Icon(Icons.password),

                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF808080),width: 2),),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF0000FF),width: 2),),

                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFFF0000),),
                    ),

                  ),


                ),


                  SizedBox(height: 16,),
                //button operatio we simply print here
                ElevatedButton(onPressed: (){
                  String username=_EmailText.text.toString();
                  String passwo=_PasswordText.text.toString();
                  print("Email: $username, Password: $passwo");



                }, child: Text(
                  'login'
                ))
              ],
            ),




      )
    );
  }
}
