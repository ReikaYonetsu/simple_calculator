import 'package:flutter/material.dart';
import 'converter_model.dart';

class ConverterScreen extends StatefulWidget {
  @override
  _ConverterScreenState createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  final TextEditingController _controller = TextEditingController();
  final ConverterModel _model = ConverterModel();
  String _result = '';

  void _convert() {
    double km = double.tryParse(_controller.text) ?? 0;
    double miles = _model.convertKmToMiles(km);
    setState(() {
      _result = '$km km is equal to ${miles.toStringAsFixed(2)} miles';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Km to Miles Converter'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter kilometers',
                labelStyle: TextStyle(fontSize: 20),  // Larger label text
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: EdgeInsets.all(15),  // Larger content padding for bigger input area
              ),
              style: TextStyle(fontSize: 20),  // Larger font size for the input text
            ),


            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.purple,  // Text color of the button
                textStyle: TextStyle(fontSize: 20),
                padding: EdgeInsets.symmetric(vertical: 15.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: _convert,
              child: Text('Convert'),
            ),

            Text(_result),
          ],
        ),
      ),
    );
  }
}
