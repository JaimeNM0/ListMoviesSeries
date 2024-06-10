import 'package:flutter/material.dart';
import 'package:list_movies_series/google_sign_in/google_sign_in.dart';
import 'package:list_movies_series/providers/series_details_api_provider.dart';
import 'package:list_movies_series/providers/series_profile_provider.dart';
import 'package:list_movies_series/screens/details.dart';
import 'package:list_movies_series/screens/home.dart';
import 'package:list_movies_series/screens/login.dart';
import 'package:list_movies_series/screens/seeker.dart';
//import 'package:list_movies_series/providers/service.dart';
import 'package:provider/provider.dart';
//import 'package:list_movies_series/screens/pruebaFuture.dart';

void main() => runApp(const Gestor());

class Gestor extends StatelessWidget {
  const Gestor({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SeriesProfileProvider()),
        ChangeNotifierProvider(create: (_) => SeriesDetailsApiProvider()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = 'List Movies Series';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      initialRoute: '/login',

      routes: {
        //'/':(context) => MyApp(),
        '/login': (context) => LoginPage(),
        '/google_sign': (context) => GoogleSignInScreen(),
        '/home': (context) => Home(),
        //'/details': (context) => DetailsSeries(),
        '/seeker': (context) => Seeker(),
      },
      theme: ThemeData(
        primarySwatch: Colors.purple, // Change the primary color here
        //backgroundColor: Colors.transparent,
      ),
      home: LoginPage(),
    );
  }
}