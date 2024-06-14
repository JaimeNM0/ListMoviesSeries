//import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:list_movies_series/models/series_profile_models.dart';
import 'package:list_movies_series/providers/series_profile_provider.dart';
import 'package:list_movies_series/screens/drawer.dart';
import 'package:list_movies_series/utils/function.dart';
import 'package:provider/provider.dart';
import 'package:list_movies_series/screens/header.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final listSeriesProfile =
        Provider.of<SeriesProfileProvider>(context, listen: false);
    const Map<String, String> usuario = {
      'nick': 'Serenn',
      'nombre': 'Juan',
      'correo': 'juan@gmail.com',
    };

    return WillPopScope(
      onWillPop: _onWillPopScope,
      child: Scaffold(
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
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "More popular:",
                    style: customTextStyle(fontSize: 22.0),
                  ),
                ),
                ListadoSeries(list: listSeriesProfile, page: '1'),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Better grades:",
                    style: customTextStyle(fontSize: 22.0),
                  ),
                ),
                ListadoSeries(list: listSeriesProfile, page: '5'),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "In emission:",
                    style: customTextStyle(fontSize: 22.0),
                  ),
                ),
                ListadoSeries(list: listSeriesProfile, page: '9'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPopScope() async {
    return false;
  }
}

class ListadoSeries extends StatelessWidget {
  final list;
  final String page;

  const ListadoSeries({super.key, required this.list, required this.page});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Series>?>(
        future: list.getListaSeries(page),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            if (snapshot.hasData) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildCard(snapshot.data![index], context);
                  },
                ),
              );
            }
            return const Text("Error no se ha encontrado nada.");
          }
        });
  }
}

Widget _buildCard(Series series, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, '/detailsSeries', arguments: series.id);
    },
    child: SizedBox(
      width: 180.0,
      height: 200.0,
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Container(
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: colorWhiteBorder,
              width: 3.0,
            ),
          ),
          decoration: const BoxDecoration(
            gradient: linearGradientFading,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Card(
            color: Color.fromARGB(0, 255, 255, 255),
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            margin: EdgeInsets.all(8.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    width: 160.0,
                    height: 140.0,
                    foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: colorWhiteBorder,
                        width: 3.0,
                      ),
                    ),
                    child: Image.network(
                      series.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    series.name,
                    textAlign: TextAlign.center,
                    style: customTextStyle(),
                    maxLines: 2,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "-",
                      style: customTextStyle(fontSize: 16.0),
                    ),
                    Text(
                      changeFormatDate(series.startDate),
                      style: customTextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
