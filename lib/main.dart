import 'package:flutter/material.dart';
import 'package:list_movies_series/google_sign_in/google_sign_in.dart';
import 'package:list_movies_series/providers/series_profile_provider.dart';
import 'package:list_movies_series/screens/Home.dart';
import 'package:list_movies_series/screens/login.dart';
//import 'package:list_movies_series/providers/service.dart';
import 'package:provider/provider.dart';
//import 'package:list_movies_series/screens/pruebaFuture.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( const Gestor());
}

class Gestor extends StatelessWidget {
  const Gestor({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SeriesProfileProvider()),
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
      },
      theme: ThemeData(
        primarySwatch: Colors.purple, // Change the primary color here
        //backgroundColor: Colors.transparent,
      ),
      home: LoginPage(),
    );
  }
}