import 'package:flutter/material.dart';
import 'package:list_movies_series/models/series_details_api_models.dart';
import 'package:list_movies_series/providers/series_details_api_provider.dart';
import 'package:list_movies_series/screens/header.dart';
import 'package:list_movies_series/screens/header.dart';
import 'package:provider/provider.dart';

class DetailsSeries extends StatelessWidget {
  final String serie;

  const DetailsSeries({super.key, required this.serie});

  @override
  Widget build(BuildContext context) {
    final detailsSeriesDetailsApiProfile =
        Provider.of<SeriesDetailsApiProvider>(context, listen: false);
    const Map<String, String> usuario = {
      'nick': 'Serenn',
      'nombre': 'Juan',
      'correo': 'juan@gmail.com',
    };

    return MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(title: usuario['nick'],),
        body: Container(
          color: const Color.fromRGBO(76, 32, 96, 1),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              top: 10.0,
            ),
            child: FutureBuilderDetails(provider: detailsSeriesDetailsApiProfile, serie: serie),
          ),
        ),
      ),
    );
  }
}

class FutureBuilderDetails extends StatelessWidget {
  final provider;
  final String serie;

  const FutureBuilderDetails({super.key, required this.provider, required this.serie});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SeriesDetailsApi>(
        future: provider.getListaSeries(serie),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            if (snapshot.hasData) {
              print(snapshot.data?.id);
              /*return Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 300,
                child: _buildCard(snapshot.requireData, context),
              );*/
            }
            return const Text("Error no se ha encontrado nada.");
          }
        });
  }
}