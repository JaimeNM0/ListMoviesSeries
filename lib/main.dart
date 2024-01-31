import 'package:flutter/material.dart';
import 'package:pruebalogin/screens/login.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyApp',
      initialRoute: 'login ',
      routes: {
        //'/':(context) => MyApp(),
        '/login': (context) => LoginPage(),
      
      },
      theme: ThemeData(
        primarySwatch: Colors.purple, // Change the primary color here
        //backgroundColor: Colors.transparent,
      ),
      home: Container(
        child: LoginPage(),
      ),
    );
  }
  
}