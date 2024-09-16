import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
      home: const MyHomePage(title: 'Lawra Project'),
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
//we take these variables here so we can change during run time inside animation
  var _width=200.0;
  var _height=100.0;
  bool flag=true;
  Decoration myDecor=BoxDecoration(borderRadius: BorderRadius.circular(2),color: Colors.grey);//by defalut
var lawRa=Text("Click the button to see my lawra size ",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),);
  //icon=Icon(Icons.thumb_up, color: Colors.purple);

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
        child: Column(



          mainAxisAlignment: MainAxisAlignment.center,
          children: [

           lawRa,
            SizedBox(height: 20,),
            AnimatedContainer(


                    width: _width,
                    height: _height,
                    curve: Curves.slowMiddle,//change here to change the movements
                    decoration: myDecor,

                duration: Duration(seconds: 2),),

                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){



                  setState(() {

                    if(flag){
                      _width=100.0;
                      _height=500.0;
                      myDecor=BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.deepOrangeAccent);

                      SizedBox(height: 20,);

                      lawRa =  Text(
                        "Morning!",
                        style: TextStyle(color: Colors.purple,fontSize:20,fontWeight: FontWeight.bold  ),
                      );


                    //flag is for once the code run then we make it false to go to the else state then by clicking again it gets true in the last of else part then the upper code run it makes toggle ;
                      flag=false;

                    }
                    else{
                        _width=200.0;
                        _height=100.0;
                        myDecor=BoxDecoration(borderRadius: BorderRadius.circular(2),color: Colors.red);


                        SizedBox(height: 20,);

                        lawRa = const Text(
                          " Evening !",
                          style: TextStyle(color: Colors.purple,fontSize:20,fontWeight: FontWeight.bold  ),
                        );


                        flag=true;

                    }


                  });



                },

                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.green, backgroundColor: Colors.transparent, // Text color
                    padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.blue, width: 2), // Border color and width
                      borderRadius: BorderRadius.circular(12.0), // Border radius
                    ),
                    elevation: 5, // Shadow
                  ),

                  child: Text("Click",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),    ),

          ],

        ),

      ),


    );
  }
}

