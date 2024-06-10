//import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:list_movies_series/models/series_profile_models.dart';
import 'package:list_movies_series/providers/series_profile_provider.dart';
import 'package:list_movies_series/screens/drawer.dart';
//import 'package:list_movies_series/screens/drawer.dart';
import 'package:provider/provider.dart';
import 'header.dart';

class Seeker extends StatelessWidget {
  const Seeker({super.key});

  @override
  Widget build(BuildContext context) {
    const Map<String, String> usuario = {
      'nick': 'Serenn',
      'nombre': 'Juan',
      'correo': 'juan@gmail.com',
    };

    return MaterialApp(
      //title: title,
      home: Scaffold(
        appBar: CustomAppBar(title: usuario["nick"]),
        drawer: CustomDrawer(usuario: usuario),
        body: Container(
          color: const Color.fromRGBO(76, 32, 96, 1),
          child: const Padding(
            padding: EdgeInsets.only(
              left: 10.0,
              top: 10.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text('Buscador'),
                  Text('Página'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}