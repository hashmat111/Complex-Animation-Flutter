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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String displayText = '0';
  String result = '';
  String operation = '';
  double firstOperand = 0;
  double secondOperand = 0;

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        displayText = '0';
        result = '';
        operation = '';
        firstOperand = 0;
        secondOperand = 0;
      } else if (buttonText == '+' || buttonText == '-' || buttonText == '×' || buttonText == '÷') {
        firstOperand = double.parse(displayText);
        operation = buttonText;
        result = '';
      } else if (buttonText == '=') {
        secondOperand = double.parse(displayText);
        if (operation == '+') {
          result = (firstOperand + secondOperand).toString();
        } else if (operation == '-') {
          result = (firstOperand - secondOperand).toString();
        } else if (operation == '×') {
          result = (firstOperand * secondOperand).toString();
        } else if (operation == '÷') {
          result = (firstOperand / secondOperand).toString();
        }
        displayText = result;
      } else {
        if (displayText == '0' || result.isNotEmpty) {
          displayText = buttonText;
          result = '';
        } else {
          displayText += buttonText;
        }
      }
    });
  }

  Widget buildButton(String buttonText, Color buttonColor) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: buttonColor,
          ),
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 24.0, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(
              displayText,
              style: const TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  buildButton('7', Colors.blue),
                  buildButton('8', Colors.blue),
                  buildButton('9', Colors.blue),
                  buildButton('÷', Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton('4', Colors.blue),
                  buildButton('5', Colors.blue),
                  buildButton('6', Colors.blue),
                  buildButton('×', Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton('1', Colors.blue),
                  buildButton('2', Colors.blue),
                  buildButton('3', Colors.blue),
                  buildButton('-', Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton('0', Colors.blue),
                  buildButton('C', Colors.red),
                  buildButton('=', Colors.green),
                  buildButton('+', Colors.orange),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
