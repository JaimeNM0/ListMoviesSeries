//import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:list_movies_series/models/series_profile_models.dart';
import 'package:list_movies_series/providers/series_profile_provider.dart';
import 'package:list_movies_series/screens/drawer.dart';
import 'package:list_movies_series/utils/fuction.dart';
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

    return Scaffold(
      appBar: CustomAppBar(title: usuario["nick"]),
      drawer: CustomDrawer(usuario: usuario),
      backgroundColor: colorPurple,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10.0,
          top: 10.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Buscador', style: customTextStyle(fontSize: 16.0),),
              Text('Página', style: customTextStyle(fontSize: 16.0),),
            ],
          ),
        ),
      ),
    );
  }
}
