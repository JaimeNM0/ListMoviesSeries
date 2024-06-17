import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list_movies_series/models/series_details_api_models.dart';
import 'package:list_movies_series/providers/series_details_api_provider.dart';
import 'package:list_movies_series/screens/drawer.dart';
import 'package:list_movies_series/screens/header.dart';
import 'package:list_movies_series/utils/function.dart';
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

    return Scaffold(
      appBar: CustomAppBarDetails(
        title: usuario['nick'],
      ),
      backgroundColor: colorPurple,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: FutureBuilderDetails(
            provider: detailsSeriesDetailsApiProfile,
            serie: serie,
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
        future: provider.getDetailsSeries(serie),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            if (snapshot.hasData) {
              return _buildDetailsSeries(snapshot.requireData, context);
            }
            print(serie);
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
              height: 260.0,
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: colorWhiteBorder,
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
                TypeValueFormatWidget(
                  type: 'Note',
                  value: '${numberFormatDate(serie.note)}/10',
                  numberFontSize: 24.0,
                ),
                const SizedBox(height: 10),
                TypeValueFormatWidget(
                  type: 'Top Score',
                  value: '#${numberRandom(1, 100)}',
                ),
                const SizedBox(height: 10),
                TypeValueFormatWidget(
                  type: 'Popular',
                  value: numberRandom(1, 999),
                ),
                const SizedBox(height: 10),
                TypeValueFormatWidget(
                  type: 'Top popular',
                  value: '#${numberRandom(1, 100)}',
                ),
                const SizedBox(height: 10),
                TypeValueFormatWidget(
                  type: 'Favourites',
                  value: numberRandom(0, 999),
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
        style: customTextStyle(fontSize: 28.0),
      ),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.star_border,
            color: Colors.grey,
            size: 50.0,
          ),
          Container(
            width: 240,
            height: 50,
            child: const styleContainerDetails(
                text: 'Add to Marked', numberFontSize: 18.0),
          ),
        ],
      ),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TypeValueFormatWidget(
            type: 'Status',
            value: serie.status,
          ),
          TypeValueFormatWidget(
            type: 'Total Chapters',
            value: '${serie.chapters} chap ${serie.seasons} s',
          ),
          TypeValueFormatWidget(
            type: 'Length',
            value: '${serie.duration} min',
          ),
        ],
      ),
      const SizedBox(height: 10),
      SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: serie.genres.length,
          itemBuilder: (BuildContext context, int index) {
            return styleContainerDetails(text: serie.genres[index]);
          },
        ),
      ),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TypeValueFormatWidget(
            type: 'Start Date',
            value: changeFormatDate(serie.startDate),
          ),
        ],
      ),
      const SizedBox(height: 10),
      Text(
        serie.description,
        textAlign: TextAlign.center,
        style: customTextStyle(fontSize: 14.0),
        maxLines: null,
      ),
    ],
  );
}

class TypeValueFormatWidget extends StatelessWidget {
  final String type;
  final String value;
  final double numberFontSize;

  const TypeValueFormatWidget({
    super.key,
    required this.type,
    required this.value,
    this.numberFontSize = 18.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          type,
          style: customTextStyle(fontSize: 14.0),
        ),
        Text(
          value,
          style: customTextStyle(fontSize: numberFontSize),
        ),
      ],
    );
  }
}

class styleContainerDetails extends StatelessWidget {
  final String text;
  final double numberFontSize;

  const styleContainerDetails(
      {super.key, required this.text, this.numberFontSize = 20.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        decoration: BoxDecoration(
          color: colorPurpleLight,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            text,
            style: customTextStyle(fontSize: numberFontSize),
          ),
        ),
      ),
    );
  }
}
