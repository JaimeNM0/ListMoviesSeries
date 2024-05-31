//import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:list_movies_series/models/product.dart';
import 'package:list_movies_series/models/series_profile_models.dart';
import 'package:list_movies_series/providers/series_profile_provider.dart';
import 'package:list_movies_series/providers/service.dart';
import 'package:provider/provider.dart';

import 'header.dart';

/*class hola extends StatelessWidget {
  static const String _title = 'Listado Series';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Productos(context),
    );
  }
}*/

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final listSeriesProfile =
        Provider.of<SeriesProfileProvider>(context, listen: false);
    const Map<String, String> usuario = {
      "nick": "Serenn",
      "nombre": "Juan",
      "correo": "juan@gmail.com",
    };
    //const title = 'Horizontal List';

    return MaterialApp(
      //title: title,
      home: Scaffold(
        appBar: MyAppBar(title: usuario["nick"]),
        body: Container(
          color: const Color.fromRGBO(76, 32, 96, 1),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Mejores calificaciones:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                ListadoSeries(list: listSeriesProfile),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Mejores calificaciones:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                ListadoSeries(list: listSeriesProfile),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final listSeriesProfile =
        Provider.of<SeriesProfileProvider>(context, listen: false);
    final usuario = null;
    return Scaffold(
      appBar: MyAppBar(title: usuario),
      body: Column(
        children: [
          const Text("Más populares"),
          /*SizedBox(
            height: 300,
            width: double.infinity,
            child: ListadoSeries(list: listSeriesProfile),
          ),*/
          ListadoSeries(list: listSeriesProfile),
          const Text("Mejores calificaciones"),
          Expanded(
            child: ListadoSeries(list: listSeriesProfile),
          ),
          const Text("Emitiendo capítulos"),
          Expanded(
            child: ListadoSeries(list: listSeriesProfile),
          ),
        ],
        //),
      ),
    );
  }
}*/ //Expanded para que no de error al tener más tamaño.

class ListadoSeries extends StatelessWidget {
  final list;

  const ListadoSeries({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Series>?>(
        future: list.getListaSeries(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            if (snapshot.hasData) {
              print(snapshot.data!.length);
              print(snapshot.data![0]);
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildCard(snapshot.data![index]);
                  },
                ),
              );
            }
            return const Text("Error no se ha encontrado nada.");
          }
        });
  }
}

/*decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color.fromRGBO(252, 92, 92, 1),
                Color.fromRGBO(252, 68, 172, 1),
                Color.fromRGBO(228, 84, 244, 1),
                Color.fromRGBO(156, 84, 244, 1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),*/

Widget _buildCard(Series series) {
  return SizedBox(
    width: 200.0,
    height: 200.0,
    child: Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        foregroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: Color.fromARGB(255, 201, 200, 200),
            width: 3.0,
          ),
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color.fromRGBO(252, 92, 92, 1),
              Color.fromRGBO(252, 68, 172, 1),
              Color.fromRGBO(228, 84, 244, 1),
              Color.fromRGBO(156, 84, 244, 1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
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
                  width: 120.0,
                  height: 120.0,
                  foregroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: Color.fromARGB(255, 201, 200, 200),
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
                child: Text(series.name),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("7"),
                  Text(series.startDate),
                ],
              ),
              Text(series.id.toString()),
            ],
          ),
        ),
      ),
    ),
  );
}

class Productos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _list_productos = Provider.of<ProductService>(context, listen: false);

    return Scaffold(
        body: FutureBuilder<List<Product>>(
            future: _list_productos.loadProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                if (snapshot.hasData) {
                  print(snapshot.data!.length);
                  print(snapshot.data![0].nombre);
                  return Text("Hola productos");
                }
                return Text("Hola productos 2");
              }
            }));
  }
}
