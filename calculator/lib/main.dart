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
  var numberOne = TextEditingController();
  var numberTwo = TextEditingController();
  var sum, sub, mul, div;
  var result = "";
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
        child: Container(
          color: Colors.orange,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                keyboardType: TextInputType.number,
                controller: numberOne,
                decoration: InputDecoration(
                    hintText: "Enter first number",
                    labelText: "Number",
                    border: OutlineInputBorder()),
              ),

              SizedBox(
                height: 12,
              ), // space betwen both textfiled

              TextField(
                keyboardType: TextInputType.number,
                controller: numberTwo,
                decoration: InputDecoration(
                    labelText: "Number",
                    hintText: "Enter second number ",
                    border: OutlineInputBorder()),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    ElevatedButton(
                        onPressed: () {
                          var no1 = int.parse(numberOne.text.toString());
                          var no2 = int.parse(numberTwo.text.toString());
                          sum = no1 + no2;
                          result = "sum of $no1 and $no2 is : $sum";
                          setState(
                              () {}); //its very important to show the operatin in one text div mul subs add
                          //extra code for style purpose only
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.purple,

                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // Rounded corners
                          ),
                          elevation: 5, // Shadow elevation
                        ), //extra code is over here for style purpose

                        child: Text("add")),
                    ElevatedButton(
                        onPressed: () {
                          var no1 = int.parse(numberOne.text.toString());
                          var no2 = int.parse(numberTwo.text.toString());
                          sub = no1 - no2;

                          result = "subs of $no1 and $no2 is :$sub";
                          setState(
                              () {}); //its very important to show the operatin in one text div mul subs add
                        },
                        child: Text("sub")),
                    ElevatedButton(
                        onPressed: () {
                          var no1 = int.parse(numberOne.text.toString());
                          var no2 = int.parse(numberTwo.text.toString());
                          mul = no1 * no2;
                          result = "mul of $no1 and $no2 is :$mul";
                          setState(
                              () {}); //its very important to show the operatin in one text div mul subs add
                        },
                        child: Text("mul")),
                    ElevatedButton(
                        onPressed: () {
                          var no1 = int.parse(numberOne.text.toString());
                          var no2 = int.parse(numberTwo.text.toString());
                          div = no1 / no2;
                          result = "div of $no1 and $no2 is :$div";
                          setState(
                              () {}); // its very important to show the operatin in one text div mul subs add
                        },
                        child: Text("div")),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Text(
                  result,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              )
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
