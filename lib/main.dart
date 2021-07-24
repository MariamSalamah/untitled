import 'package:flutter/material.dart';
import 'package:untitled/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
       primaryColor: Color.fromRGBO(0, 0, 2, 1),
        scaffoldBackgroundColor: Color.fromRGBO(0, 0, 2, 1),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


