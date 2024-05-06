import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _displayText = '0';

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _displayText = '0';
      } else if (buttonText == '=') {
        _displayText = _calculate(_displayText);
      } else {
        if (_displayText == '0') {
          _displayText = buttonText;
        } else {
          _displayText += buttonText;
        }
      }
    });
  }

  String _calculate(String input) {
    // Implement your calculation logic here
    return '0';
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
            onPressed: () {
              _buttonPressed(buttonText);
            },
            child: Text(
              buttonText,
              style: const TextStyle(
                fontSize: 24.0,
              ),
            ),
          )
      ),
    );
  }
}