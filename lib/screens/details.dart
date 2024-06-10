import 'package:flutter/material.dart';
import 'package:list_movies_series/models/series_details_api_models.dart';
import 'package:list_movies_series/providers/series_details_api_provider.dart';
import 'package:list_movies_series/screens/drawer.dart';
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
        appBar: CustomAppBar(
          title: usuario['nick'],
        ),
        drawer: CustomDrawer(usuario: usuario),
        backgroundColor: const Color.fromRGBO(76, 32, 96, 1),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FutureBuilderDetails(
              provider: detailsSeriesDetailsApiProfile,
              serie: serie,
            ),
          ),
        ),
      ),
    );
  }
}

class FutureBuilderDetails extends StatelessWidget {
  final provider;
  final String serie;

  const FutureBuilderDetails(
      {super.key, required this.provider, required this.serie});

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
              return _buildDetailsSeries(snapshot.requireData, context);/*Container(
                child: _buildDetailsSeries(snapshot.requireData, context),
              );*/
            }
            return const Text("Error no se ha encontrado nada.");
          }
        });
  }
}

Widget _buildDetailsSeries(SeriesDetailsApi serie, BuildContext context) {
  return Column(
    children: [
      Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              width: 180.0,
              height: 240.0,
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: Color.fromARGB(255, 201, 200, 200),
                  width: 3.0,
                ),
              ),
              child: Image.network(
                serie.poster,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Note',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontFamily: 'Roboto',
                  ),
                ),
                Text(
                  serie.note,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      SizedBox(height: 20),
      Text(
        serie.title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 28.0,
          fontFamily: 'Roboto',
        ),
      ),
      SizedBox(height: 10),
      Text(
        serie.description,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14.0,
          fontFamily: 'Roboto',
        ),
        maxLines: null,
        overflow: TextOverflow.visible,
      ),
      SizedBox(height: 10),
      Text(
        serie.status,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontFamily: 'Roboto',
        ),
        maxLines: null,
        overflow: TextOverflow.visible,
      ),
    ],
  );
}
