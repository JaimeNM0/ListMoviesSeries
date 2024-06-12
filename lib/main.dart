import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Importa el paquete para controlar la orientación de la pantalla
import 'package:list_movies_series/google_sign_in/google_sign_in.dart';
import 'package:list_movies_series/providers/series_details_api_provider.dart';
import 'package:list_movies_series/providers/series_profile_provider.dart';
import 'package:list_movies_series/screens/details.dart';
import 'package:list_movies_series/screens/home.dart';
import 'package:list_movies_series/screens/login.dart';
import 'package:list_movies_series/screens/seeker.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation
        .portraitUp, // Solo permite orientación vertical hacia arriba
    DeviceOrientation
        .portraitDown, // Solo permite orientación vertical hacia abajo
  ]);
  runApp(const Gestor());
}

class Gestor extends StatelessWidget {
  const Gestor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SeriesProfileProvider()),
        ChangeNotifierProvider(create: (_) => SeriesDetailsApiProvider()),
      ],
      child: const MyApp(),
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
        '/login': (context) => LoginPage(),
        '/google_sign': (context) => GoogleSignInScreen(),
        '/home': (context) => Home(),
        //'/details': (context) => DetailsSeries(),
        '/seeker': (context) => Seeker(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/detailsSeries') {
          final id = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) {
              return DetailsSeries(serie: id);
            },
          );
        }
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
      theme: ThemeData(
        primarySwatch: Colors.purple, // Cambia el color primario aquí
      ),
      home: LoginPage(),
    );
  }
}
