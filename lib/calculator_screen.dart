import 'package:flutter/material.dart';
import 'calculator_model.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _displayText = '0';
  final CalculatorModel _calculator = CalculatorModel();  // Create an instance of the model

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _displayText = '0'; // Clear the display.
      } else if (buttonText == '=') {
        if (_displayText.contains(' ')) {
          // Only calculate if there's an expression to evaluate.
          try {
            _displayText = _calculator.calculate(_displayText).toString();
          } catch (e) {
            _displayText = 'Error: ' + e.toString();
          }
        }
      } else {
        if (_displayText == '0' || _displayText == '0.0') {
          if (buttonText == '+' || buttonText == '-' || buttonText == '*' || buttonText == '/') {
            _displayText += ' ' + buttonText + ' '; // Start new expression with operator if 0 or 0.0 is on screen.
          } else {
            _displayText = buttonText; // Replace zero with number.
          }
        } else {
          if (buttonText == '+' || buttonText == '-' || buttonText == '*' || buttonText == '/') {
            _displayText += ' ' + buttonText + ' '; // Append operator with spaces.
          } else {
            _displayText += buttonText; // Append number or decimal point.
          }
        }
      }
    });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                _displayText,
                style: const TextStyle(
                  fontSize: 48.0,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _createButton('1'),
                _createButton('2'),
                _createButton('3'),
                _createButton('/'),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _createButton('4'),
                _createButton('5'),
                _createButton('6'),
                _createButton('*'),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _createButton('7'),
                _createButton('8'),
                _createButton('9'),
                _createButton('-'),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _createButton('0'),
                _createButton('.'),
                _createButton('C'),
                _createButton('+'),
                _createButton('='),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _createButton(String buttonText) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton(
          onPressed: () => _buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 24.0),
          ),
        ),
      ),
    );
  }

}