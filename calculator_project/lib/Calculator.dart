 import 'package:flutter/cupertino.dart';
 import 'package:flutter/material.dart';

// class Calculator extends StatefulWidget{
//
//
//   @override
//   State<Calculator> createState() => _CalculatorState();
// }
//
// class _CalculatorState extends State<Calculator> {
//
//   var numberOne=TextEditingController();
//   var numberTwo=TextEditingController();
//   var sum,sub,mul,div;
//   var result;
//   var finalResult="";
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//
//       appBar: AppBar(
//
//           title: Text(" calculate",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black,backgroundColor: Color(0xfffff1eb)),),
//       ),
//
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Center(
//           child: Container(
//                 width: double.infinity,
//                 height: double.infinity,
//
//
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Color(0xfffff1eb), // Gradient start color
//                   Color(0xfface0f9), // Gradient end color
//                 ],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//
//
//             child: Padding(
//               padding: const EdgeInsets.only(top: 20.0,left: 8,right: 8,),
//
//               child: Column(
//                          //   mainAxisAlignment: MainAxisAlignment.center,
//               //  crossAxisAlignment: CrossAxisAlignment.center,
//
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                    //Text("Enter the value for calculatoin screen"),
//                       Container(
//                         width: double.infinity,
//                         height:200,
//                        color: Colors.blueGrey,),
//
//                    //   TextField(controller: numberOne,style: TextStyle(color: Colors.green),),
//                      // SizedBox(height: 15,),
//                       //TextField(controller: numberTwo,),
//
//                         ]
//                       ),
//                   ),
//                    SizedBox(height: 50,),
//
//
//
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//
//                       ElevatedButton(onPressed: (){
//                         var num1=numberOne.text.toString();
//                         //var num2=numberTwo.text.toString();
//                         //convert to parse
//                         var con_num1=int.parse(num1);
//                        // var con_num2=int.parse(num2);
//                         result= con_num1;
//                         finalResult="$con_num1";
//                         setState(() {
//
//                         });
//
//
//
//
//                       }, child: Text("1")),
//                       Text(finalResult,),
//
//                       ElevatedButton(onPressed: (){}, child: Text("2")),
//                       ElevatedButton(onPressed: (){}, child: Text("3")),
//                     ],
//                   ),
//                   Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       ElevatedButton(onPressed: (){}, child: Text("4")),
//                       ElevatedButton(onPressed: (){}, child: Text("5")),
//                       ElevatedButton(onPressed: (){}, child: Text("6")),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   //  crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//
//                       ElevatedButton(onPressed: (){}, child:Text("7")),
//                       ElevatedButton(onPressed: (){}, child:Text("8")),
//                       ElevatedButton(onPressed: (){}, child:Text("9")),
//
//                     ],
//                   )
//                   ,
//                   SizedBox(height: 16,),
//                   Container(
//                     color: Color(0xfff5f7fa),
//                     width: 400,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       //  crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//
//                         ElevatedButton(onPressed: (){}, child:Text("+",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21),)),
//                         ElevatedButton(onPressed: (){}, child:Text("-",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21),)),
//                         ElevatedButton(onPressed: (){}, child:Text("*",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21),)),
//
//                       ],
//
//                     ),
//                   ),
//                   Container(
//                     color: Color(0xfff5f7fa),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       //  crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//
//                         ElevatedButton(onPressed: (){}, child:Text("/",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21),)),
//                         ElevatedButton(onPressed: (){}, child:Text("=",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21),)),
//                         ElevatedButton(onPressed: (){}, child:Text("C",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21),)),
//
//                       ],
//
//                     ),
//                   )
//
//
//                 ],
//
//
//               ),
//             ),
//
//           ),
//         ),
//       ) ,
//
//     );
//
//
//   }
// }

 // the above code is only the designing part so you can use it for any new operation if you wanted

class Calculator extends StatefulWidget {
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _input = ""; // Current input
  String _operation = ""; // Current operation
  String _display = ""; // Displayed sequence
  double? _firstNumber; // First number
  double? _secondNumber; // Second number
  String _result = ""; // Result of the operation

  // Function to handle number button press
  void _onNumberButtonPressed(String value) {
    setState(() {
      _input += value;
      _display += value;
    });
  }

  // Function to handle operation button press
  void _onOperationButtonPressed(String operation) {
    setState(() {
      if (_input.isNotEmpty) {
        _firstNumber = double.tryParse(_input);
        _operation = operation;
        _display += " $operation ";
        _input = ""; // Clear input for the next number
      }
    });
  }

  // Function to handle the equals button press
  void _onEqualsButtonPressed() {
    setState(() {
      if (_input.isNotEmpty && _firstNumber != null && _operation.isNotEmpty) {
        _secondNumber = double.tryParse(_input);

        switch (_operation) {
          case "+":
            _result = (_firstNumber! + _secondNumber!).toString();
            break;
          case "-":
            _result = (_firstNumber! - _secondNumber!).toString();
            break;
          case "*":
            _result = (_firstNumber! * _secondNumber!).toString();
            break;
          case "/":
            if (_secondNumber != 0) {
              _result = (_firstNumber! / _secondNumber!).toString();
            } else {
              _result = "Error"; // Handle division by zero
            }
            break;
        }

        _display = _result; // Update display with the result
        _input = _result; // Use the result as the next input
        _firstNumber = null; // Reset for the next calculation
        _secondNumber = null;
        _operation = "";
      }
    });
  }

  // Function to clear the input and reset the calculator
  void _onClearButtonPressed() {
    setState(() {
      _input = "";
      _display = "";
      _result = "";
      _firstNumber = null;
      _secondNumber = null;
      _operation = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            backgroundColor: Color(0xfffff1eb),
          ),
        ),
      ),



      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(

          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xfffff1eb), // Gradient start color
                  Color(0xfface0f9), // Gradient end color
                ],
               // begin: Alignment.topLeft,
               // end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 8,
                right: 8,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200,
                          //color: Colors.grey,
                          child: Center(
                            child: Text(
                              _display.isEmpty ? "0" : _display,
                              style: TextStyle(
                                fontSize: 48,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _onNumberButtonPressed("1");
                        },
                        child: Text("1"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _onNumberButtonPressed("2");
                        },
                        child: Text("2"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _onNumberButtonPressed("3");
                        },
                        child: Text("3"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _onNumberButtonPressed("4");
                        },
                        child: Text("4"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _onNumberButtonPressed("5");
                        },
                        child: Text("5"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _onNumberButtonPressed("6");
                        },
                        child: Text("6"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _onNumberButtonPressed("7");
                        },
                        child: Text("7"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _onNumberButtonPressed("8");
                        },
                        child: Text("8"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _onNumberButtonPressed("9");
                        },
                        child: Text("9"),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    color: Color(0xfff5f7fa),
                    width: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _onOperationButtonPressed("+");
                          },
                          child: Text(
                            "+",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _onOperationButtonPressed("-");
                          },
                          child: Text(
                            "-",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _onOperationButtonPressed("*");
                          },
                          child: Text(
                            "*",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Color(0xfff5f7fa),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _onOperationButtonPressed("/");
                          },
                          child: Text(
                            "/",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: _onEqualsButtonPressed,
                          child: Text(
                            "=",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: _onClearButtonPressed,
                          child: Text(
                            "C",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
