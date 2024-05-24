import 'package:flutter/material.dart';
import 'package:list_movies_series/providers/series_profile_provider.dart';
import 'package:list_movies_series/screens/Home.dart';
import 'package:list_movies_series/providers/service.dart';
import 'package:provider/provider.dart';
//import 'package:list_movies_series/screens/pruebaFuture.dart';

void main() => runApp(Gestor());

class Gestor extends StatelessWidget {
  const Gestor({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
     providers: [
      ChangeNotifierProvider (create: (_) => SeriesProfileProvider()),
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
      //color: ColorFondoAmarillo.fondoAmarillo,
      title: _title,
      initialRoute: '/home',
      
      routes: {
        //'/':(context) => MyApp(),
        '/home':(context) => Home(),
        /*'/login':(context) => Login(),
        '/menu': (context) => Menu(),
        '/ocio_listado' : (context) => OcioListado(),
        '/ocio_card' : (context) => OcioCard(),*/
      },
       /*theme: ThemeData(
        primarySwatch:ColorRojo.rojo,
        secondaryHeaderColor: ColorBlanco.blanco,
        hintColor: ColorRojoOscuro.rojoOscuro,
      ),*/
      home: Home(),
    );
  }
}

class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      
      home: Productos(),//const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
