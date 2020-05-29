import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PicsCall',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to PicsCall'),
        ),
        body: Center(
          child: Text('Hi from MLH'),
        ),
      ),
    );
  }
}

