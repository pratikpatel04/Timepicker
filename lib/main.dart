import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fluter',
      home: MyHomePage(title: 'Time',),
    );
  }
}

class MyHomePage extends StatefulWidget {
   MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  TimeOfDay selectedTime = TimeOfDay.now();

  
  Future <Null> _selectTime(BuildContext context) async {

  final TimeOfDay? picked = await showTimePicker(
    context: context, 
    initialTime: selectedTime); 

  if (picked != null && picked != selectedTime)
  setState(() {
    selectedTime = picked;
  });
}

  @override
  Widget build(BuildContext context) {

    final MaterialLocalizations localizations = MaterialLocalizations.of(context);

    final String resultTime = localizations.formatTimeOfDay(selectedTime);
    return Scaffold(
      appBar: AppBar(  
        title: Text(widget.title),
      ),

      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(resultTime), 

            SizedBox(height: 20.0,),

            ElevatedButton(onPressed: (() =>  _selectTime(context) ),
         
            child:  Text('Select Time'),
          
          ),
        ],
        ),

      ),
    );
  }
}